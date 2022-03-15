//
//  MovieSearchDataSource.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

class MovieSearchDataSource: NSObject {
  
  typealias RowItem = MovieSearchModule.MovieTableItem
  
  weak var tableView: UITableView?
  weak var presenter: MovieSearchModule.Presenter?
  
  private var items: [RowItem] = []
  private var pageCount: Int = 1
  private let refreshControl = UIRefreshControl()
  
  required init(_ tableView: UITableView) {
    super.init()
    self.tableView = tableView
    registerCells()
    self.tableView?.sectionHeaderHeight = UITableView.automaticDimension
    self.tableView?.separatorStyle = .none
    self.tableView?.rowHeight = UITableView.automaticDimension
    self.tableView?.sectionHeaderHeight = 30
    self.tableView?.estimatedRowHeight = 40
    self.tableView?.dataSource = self
    self.tableView?.delegate = self
    self.tableView?.removeFooterView()
    self.tableView?.contentInsetAdjustmentBehavior = .never
    self.tableView?.reloadData()
    //    refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
    //    self.tableView?.addSubview(refreshControl)
  }
  
  private func registerCells() {
    tableView?.registerCell(EmptyCell.self)
    tableView?.registerCell(MovieSearchCell.self)
    tableView?.registerHeaderFooterView(HeaderView.self)
  }
  
  @objc
  private func refresh(_ sender: AnyObject) {
    refreshControl.endRefreshing()
    //    presenter?.didScrollToRefresh()
  }
}

extension MovieSearchDataSource {
  
  public func setItems(_ items: [RowItem]) {
    self.items = items
    DispatchQueue.main.async {
      self.tableView?.reloadData()
    }
  }
}

extension MovieSearchDataSource: UITableViewDataSource, UIScrollViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    switch items[section] {
    case .empty:
      return 1
    case .movie(model: let model):
      return model.movie.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    
    switch items[indexPath.section] {
    case .movie(model: let model):
      let movieCell: MovieSearchCell = tableView.dequeueReusableCell(indexPath: indexPath)
      movieCell.prepareMovieCell(for: model.movie[indexPath.row])
      
      //      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      
      //      }
      cell = movieCell
    case .empty(errorDescription: let message):
      let emptyCell: EmptyCell = tableView.dequeueReusableCell(indexPath: indexPath)
      emptyCell.prepareErrorText(description: .init(rawValue: message) ?? .non)
      cell = emptyCell
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    switch items[section] {
      
    case .empty:
      let headerView: HeaderView = tableView.dequeueReusableHeaderFooterView()
      headerView.titleLabel.text = "Hata"
      headerView.tintColor = .clear
      return headerView
    case .movie(model: let model):
      let headerView: HeaderView = tableView.dequeueReusableHeaderFooterView()
      headerView.titleLabel.text = "Sayfa \(model.title)"
      headerView.tintColor = .clear
      return headerView
    }
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if case .movie = items.first {
      let offsetY = scrollView.contentOffset.y
      let contentHeight = scrollView.contentSize.height
      
      if offsetY > contentHeight - scrollView.frame.size.height {
        
        self.presenter?.didChangePage(page: String(self.pageCount))
      }
    }
  }
}

extension MovieSearchDataSource: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch items[indexPath.section] {
      
    case .empty:
      break
    case .movie(model: let model):
      presenter?.prepareNavigateToDetailVC(for: model.movie[indexPath.row])
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch items[indexPath.section] {
    case .movie:
      return 160
    case .empty:
      return 185
    }
  }
}
