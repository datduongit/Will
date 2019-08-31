//
//  Reusable.swift
//  Will
//
//  Created by Edric D. on 8/31/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import UIKit

protocol Reusable {
    static var reuseID: String { get }
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}

extension UIViewController: Reusable {}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError() }
        return cell
    }
}

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError() }
        return cell
    }
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType type: T.Type = T.self) -> T {
        guard let viewController = instantiateViewController(withIdentifier: type.reuseID) as? T else { fatalError() }
        return viewController
    }
}



