//
//  ViewController.swift
//  Movies
//
//  Created by Marcos Schead on 13/11/17.
//  Copyright © 2017 Marcos Schead. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    typealias StoreSubscriberStateType = MoviesListingState
    
    @IBOutlet weak var movieTable: UITableView!

    let movies = ["Homem Aranha", "Thor", "Matrix", "A Origem", "Homem de Ferro", "Interestellar"]

    override func viewDidLoad() {
        super.viewDidLoad()

        movieTable.delegate = self
        movieTable.dataSource = self
    }
    

    
    func newState(state: MoviesListingState) {
        
    }
    
    // METODOS TABELA: colocar em classe separada
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
//            fatalError("The dequeued cell is not an instance of MovieCell.")
//        }

//        cell.nome.text

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
            fatalError("The dequeued cell is not an instance of MovieCell.")
        }

        let row = indexPath.row
        cell.nome.text = movies[row]

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

