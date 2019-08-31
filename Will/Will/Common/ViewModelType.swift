//
//  ViewModelType.swift
//  Will
//
//  Created by Edric D. on 8/31/19.
//  Copyright © 2019 The Upside Down. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
