//
//  UITableView+Extension.swift
//  LoodosMovie
//
//  Created by Ufuk Köşker on 15.03.2022.
//

import UIKit

extension UITableView {
  
  func removeHeaderView() {
    tableHeaderView = .init()
  }

  func removeFooterView() {
    tableFooterView = .init()
  }

  func normalizedContentSizeHeight() -> CGFloat {
    return contentSize.height + contentInset.top + contentInset.bottom
  }

  func updateCellSize(cell: UITableViewCell, refItemSize: CGSize, minRefItemHeight: CGFloat = 0) {
    let newSize = sizeThatFits(.init(width: refItemSize.width, height: CGFloat.greatestFiniteMagnitude))
    
    guard newSize.height >= minRefItemHeight else { return }
    
    if refItemSize.height != newSize.height {
      UIView.setAnimationsEnabled(false)
      beginUpdates()
      endUpdates()
      UIView.setAnimationsEnabled(true)
      if let thisIndexPath = indexPath(for: cell) {
        scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
      }
    }
  }
}

// MARK: - Registration Cells
typealias NibLoadableTableCell = UITableViewCell & NibLoadable
typealias NibLoadableTableHeaderFooterView = UITableViewHeaderFooterView & NibLoadable

extension UITableView {
  
  func registerCell(_ cells: NibLoadableTableCell.Type...) {
    for cell in cells {
      register(cell.defaultNib, forCellReuseIdentifier: cell.defaultNibName)
    }
  }

  func dequeueReusableCell<Cell: UITableViewCell>(identifier: String = Cell.defaultReuseIdentifier, indexPath: IndexPath) -> Cell {
    self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
  }
  
  func registerCellFromNib<Cell: NibLoadableTableCell>(_ cellClass: Cell.Type, nibName: String = Cell.defaultNibName, identifier: String = Cell.defaultNibName) {
    guard let _ = Bundle.main.path(forResource: nibName, ofType: "nib") else {
      self.register(cellClass, forCellReuseIdentifier: identifier)
      return
    }
    register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: identifier)
  }
  
  func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type, identifier: String = Cell.defaultReuseIdentifier) {
    register(cellClass, forCellReuseIdentifier: identifier)
  }
  
  func dequeueReusableHeaderFooterView<View: UITableViewHeaderFooterView>(identifier: String = View.defaultReuseIdentifier) -> View {
    dequeueReusableHeaderFooterView(withIdentifier: identifier) as! View
  }
  
  func registerHeaderFooterViewFromNib<View: NibLoadableTableHeaderFooterView>(_ viewClass: View.Type, nibName: String = View.defaultNibName, identifier: String = View.defaultNibName) {
    register(UINib(nibName: nibName, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
  }
  
  func registerHeaderFooterView<View: UITableViewHeaderFooterView>(_ viewClass: View.Type, identifier: String = View.defaultReuseIdentifier) {
    register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
  }
}
