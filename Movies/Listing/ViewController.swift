//
//  ViewController.swift
//  Movies
//
//  Created by Marcos Schead on 13/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoreSubscriber, UISearchBarDelegate {

    typealias StoreSubscriberStateType = MoviesListingState

    @IBOutlet weak var movieTable: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStore.subscribe(self, selector: { $0.moviesListingState })

        MoviesListingService().getMovies(page:1) { (result) in
            switch result {
            case .success(let moviePage):
                mainStore.dispatch(SetMovieListAction(moviePage.results))
            case .failure(let error):
                fatalError("error: \(error.localizedDescription)")
            }
        }

        movieTable.delegate = self
        movieTable.dataSource = self
        searchBar.delegate = self
    }

    func newState(state: MoviesListingState) {
        searchBar.isHidden = state.isSearchBarHidden
        movies = state.filteredMovies
        movieTable.reloadData()
    }

    // METODOS TABELA: colocar em classe separada

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
            fatalError("The dequeued cell is not an instance of MovieCell.")
        }

        mainStore.dispatch(SetMovieAction(movie: movies[indexPath.row]))

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
            fatalError("The dequeued cell is not an instance of MovieCell.")
        }

        cell.setFieldValue(movie: movies[indexPath.row])
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        mainStore.dispatch(ToggleSearchBarAction())
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainStore.dispatch(FilterBySearchAction(searchParam: searchBar.text ?? ""))
    }
}

