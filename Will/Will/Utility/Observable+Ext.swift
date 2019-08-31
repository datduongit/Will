//
//  Observable+Ext.swift
//  Will
//
//  Created by Edric D. on 8/31/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension ObservableType where Element == Bool {
    /// Boolean not operator
    public func not() -> Observable<Bool> {
        return map(!)
    }
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}
