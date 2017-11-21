//
//  MovieListingActionsTest.swift
//  MoviesTests
//
//  Created by Marcos Schead on 21/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import XCTest
@testable import Movies
import ReSwift


class MovieListingActionsTest: XCTestCase {
    
    var movies: [Movie] = []
    
    override func setUp() {
        super.setUp()
        
        let movie1 = Movie(vote_count: 5, id: 1, video: false, vote_average: 10, title: "It", popularity: 8, poster_path: "", original_language: "English", original_title: "", genre_ids: [], backdrop_path: "", adult: false, overview: "", release_date: "2017")
        let movie2 = Movie(vote_count: 5, id: 2, video: false, vote_average: 10, title: "Thor: Ragnarok", popularity: 10, poster_path: "", original_language: "English", original_title: "", genre_ids: [], backdrop_path: "", adult: false, overview: "", release_date: "2017")
        let movie3 = Movie(vote_count: 5, id: 3, video: false, vote_average: 10, title: "The Godfather", popularity: 10, poster_path: "", original_language: "English", original_title: "", genre_ids: [], backdrop_path: "", adult: false, overview: "", release_date: "1972")
        
        movies = [movie1, movie2, movie3]
    }
    
    // considerando apenas o titulo dos filmes
    func testSetMovieListAction() {
        let moviesExpected = movies

        mainStore.dispatch(SetMovieListAction(moviesExpected))

        let moviesResult = mainStore.state.moviesListingState.movies

        XCTAssert(moviesResult.count == moviesExpected.count)
        for index in 0..<moviesExpected.count {
            XCTAssert(moviesExpected[index].title == moviesResult[index].title)
        }
    }
    
    func testSetMovieGenresAction() {
        let genresExpected = "Horror, Action"
        
        mainStore.dispatch(SetMovieGenresAction(genres: genresExpected))
        let genresResult = mainStore.state.movieDetailState.generos
        
        XCTAssert(genresExpected == genresResult)
        
    }
    func testToggleSearchBarAction() {
        let moviesExpected = movies
        mainStore.state.moviesListingState.movies = movies
        
        // aqui teria um teste pra true também
        mainStore.state.moviesListingState.isSearchBarHidden = false
        
        mainStore.dispatch(ToggleSearchBarAction())
        
        let moviesResult = mainStore.state.moviesListingState.filteredMovies
        
        XCTAssert(moviesResult.count == moviesExpected.count)
        for index in 0..<moviesExpected.count {
            XCTAssert(moviesExpected[index].title == moviesResult[index].title)
        }
    }
    
    func testFilterBySearchAction() {
        mainStore.state.moviesListingState.movies = movies
        mainStore.dispatch(FilterBySearchAction(searchParam: "Thor"))
        let movie = mainStore.state.moviesListingState.filteredMovies[0]
        
        XCTAssert(movie.title == movies[1].title)

    }
    
    func testFilterByYear() {
        mainStore.state.moviesListingState.movies = movies
        let action = ApplyFilterAction(year: "1972")
        mainStore.dispatch(action)
        
        let movie = mainStore.state.moviesListingState.filteredMovies[0]
        
        XCTAssert(movie.title == movies[2].title)
    }
    
    func testClearFilterAction() {
        let moviesResult = movies
        
        mainStore.state.moviesListingState.movies = movies
        mainStore.dispatch(ClearFilterAction())
        
        let moviesExpected = mainStore.state.moviesListingState.filteredMovies
        
        XCTAssert(moviesResult.count == moviesExpected.count)
        for index in 0..<moviesExpected.count {
            XCTAssert(moviesExpected[index].title == moviesResult[index].title)
        }
    }
    
}
