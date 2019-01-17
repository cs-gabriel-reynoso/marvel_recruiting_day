//
//  String+Error.swift
//  Marvel
//
//  Created by gabriel.n.reynoso on 17/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import Foundation

extension String: Error {
    public var localizedDescription: String { return self }
}
