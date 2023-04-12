//
//  UITableViewExtension.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 11/4/23.
//

import UIKit

extension UITableView {
    
    func updateHeader() {
        
        guard let headerView = self.tableHeaderView else {
            return
        }
        
        let width = self.bounds.size.width
        
        let size = CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)
        let headersSize = headerView.systemLayoutSizeFitting(size, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        
        if headerView.frame.size.height != headersSize.height {
            headerView.frame.size.height = headersSize.height
            self.tableHeaderView = headerView
        }
    }
    
    func updateFooter() {
        
        guard let footerView = self.tableFooterView else {
            return
        }
        
        let width = self.bounds.size.width
        
        let size = CGSize(width: width, height: UIView.layoutFittingCompressedSize.height)
        let footerSize = footerView.systemLayoutSizeFitting(size, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        
        if footerView.frame.size.height != footerSize.height {
            footerView.frame.size.height = footerSize.height
            self.tableFooterView = footerView
        }
    }
    
    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        self.register( cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else { fatalError() }
        return cell
    }
    
}
