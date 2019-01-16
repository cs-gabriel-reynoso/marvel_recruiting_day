//
//  CharacterCollectionCell.swift
//  Marvel
//
//  Created by Thiago Lioy on 20/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit
import Reusable

final class CharacterCollectionCell: UICollectionViewCell, ReusableViewCodeBased {
    
    private var characterThumbImage: UIImageView!
    private var darkLayerView: UIView!
    private var characterNameLabel: UILabel!
    
    var needsSetup: Bool = true

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
       darkLayerView.addSubview(characterNameLabel)
    }
    
    func setupComponents() {
        characterThumbImage = UIImageView(frame: .zero)
        darkLayerView = UIView(frame: .zero)
        characterNameLabel = UILabel(frame: .zero)
    }
    
    func setupAutolayout() {
        characterThumbImage.attachToSafeArea(margin: 5)
        
        darkLayerView.attachToSafeAreaLeftRightAnchors(margin: 5)
        darkLayerView.bottomAnchor.constraint(equalTo: characterThumbImage.bottomAnchor).isActive = true
        darkLayerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        characterNameLabel.attachToSafeArea(margin: 0)
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    func setup(character: Character) {
        characterThumbImage.download(image: character.thumbImage?.fullPath() ?? "")
        darkLayerView.backgroundColor = .black
        darkLayerView.layer.opacity = 0.6
        characterNameLabel.text = character.name
        
        name.text = character.name
        thumb.download(image: character.thumbImage?.fullPath() ?? "")
    }
    
}
