//  
//  MovieSearchVC.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 14.03.2022.
//

import UIKit

class MovieSearchVC: UIViewController, MovieSearchModule.View {

  @IBOutlet weak var movieTableView: UITableView!
  
  let searchController = UISearchController()
  private var dataSource: MovieSearchDataSource!
  var presenter: MovieSearchModule.Presenter!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      title = "Loodos Moviee"
      searchController.searchBar.delegate = self
      navigationItem.searchController = searchController
      setupUI()
    }
  
  private func setupUI() {
    dataSource = .init(movieTableView)
    dataSource.presenter = presenter
  }
}
 
extension MovieSearchVC: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text else { return }
    if searchText != "" && searchText != " "{
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        self.presenter.didSearchMovie(searchText)
      }
    }
  }
  
  func updateMovieTableView(for movie: [MovieSearchModule.MovieTableItem]) {
    dataSource.setItems(movie)
  }
}

