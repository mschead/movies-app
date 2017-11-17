//
//  MovieDetailService.swift
//  Movies
//
//  Created by Leonardo Fontes on 16/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import Foundation

class MovieDetailService {
    static let API_KEY =  "67f7e91fe576c46783addc2192b12d90"

    func getGenres(page: Int = 1, orderBy: String = "list", completion: ((Result<[Genre]>) -> Void)?) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/genre/movie/\(orderBy)"
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: "\(MoviesListingService.API_KEY)"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "\(page)")
        ]
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                guard responseError == nil else {
                    completion?(.failure(responseError!))
                    return
                }
                guard let jsonData = responseData else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                    return
                }

                let decoder = JSONDecoder()

                do {
                    let genrePage = try decoder.decode(GenrePage.self, from: jsonData)
                    completion?(.success(genrePage.genres))
                } catch {
                    completion?(.failure(error))
                }
            }
        }

        task.resume()
    }
}
