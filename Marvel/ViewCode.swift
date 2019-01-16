//
//  ViewCode.swift
//  Marvel
//
//  Created by gabriel.n.reynoso on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import Reusable

protocol ViewCodeBased {
    func setupComponents()
    func setupAutolayout()
    func setupAdditional()
    func setupView()
}

extension ViewCodeBased {
    
    func setupAdditional() {}
    
    func setupView() {
        setupComponents()
        setupAutolayout()
        setupAdditional()
    }
}

protocol ReusableViewCodeBased: (ViewCodeBased & Reusable) {
    
    var needsSetup: Bool { get set }
    
}

extension ReusableViewCodeBased {
    
    func setupView() {
        if needsSetup {
            setupComponents()
            setupAutolayout()
            setupAdditional()
            needsSetup = false
        }
    }
}
