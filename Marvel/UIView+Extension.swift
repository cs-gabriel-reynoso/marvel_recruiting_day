//
//  UIView+Extension.swift
//  Marvel
//
//  Created by gabriel.n.reynoso on 16/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import UIKit

extension UIView {
    
    func attachToSafeArea(margin: CGFloat = 0) {
        attachToSafeAreaLeftRightAnchors(margin: margin)
        attachToSafeAreaTopBottomAnchors(margin: margin)
    }
    
    func attachToSafeAreaLeftRightAnchors(margin: CGFloat = 0) {
        guard let parent = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.leftAnchor, constant: margin).isActive = true
        rightAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.rightAnchor, constant: -margin).isActive = true
    }
    
    func attachToSafeAreaTopBottomAnchors(margin: CGFloat = 0) {
        guard let parent = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: -margin).isActive = true
    }
    
    func attachToSafeAreaCenterYXAnchors() {
        guard let parent = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
}
