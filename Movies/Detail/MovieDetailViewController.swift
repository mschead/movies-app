//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Marcos Schead on 14/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import UIKit
import ReSwift

class MovieDetailViewController: UIViewController, StoreSubscriber{
    
    @IBOutlet weak var name: UILabel!
    
    typealias StoreSubscriberStateType = MovieDetailState

    override func viewDidLoad() {
        super.viewDidLoad()

        mainStore.subscribe(self, selector: { $0.movieDetailState })
    }

    func newState(state: MovieDetailState) {
        name.text = state.name
    }
}
