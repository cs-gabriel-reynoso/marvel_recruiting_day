//
//  CharacterViewController.swift
//  Marvel
//
//  Created by thiago.lioy on 08/11/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import Reusable

final class CharacterViewController: UIViewController, ReusableViewCodeBased {
    var needsSetup: Bool = true
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterDescription: UILabel!
    
    private var characterThumbImage: UIImageView!
    private var darkLayerView: UIView!
    private var characterDescriptionLabel: UILabel!
    
    let character: Character
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func commonInit() {
        darkLayerView.addSubview(characterDescriptionLabel)
    }
    
    func setupComponents() {
        characterThumbImage = UIImageView(frame: .zero)
        darkLayerView = UIView(frame: .zero)
        characterDescriptionLabel = UILabel(frame: .zero)
    }
    
    func setupAutolayout() {
        characterThumbImage.attachToSafeArea()
        
        darkLayerView.attachToSafeAreaLeftRightAnchors(margin: 5)
        darkLayerView.bottomAnchor.constraint(equalTo: characterThumbImage.bottomAnchor).isActive = true
        darkLayerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        characterDescriptionLabel.attachToSafeArea(margin: 0)
    }
    
    func setupView() {
        darkLayerView.backgroundColor = .black
        darkLayerView.layer.opacity = 0.6
        characterThumbImage.download(image: character.thumbImage?.fullPath() ?? "")
        
        characterDescriptionLabel.numberOfLines = 3
        characterDescriptionLabel.textColor = .white
        characterDescriptionLabel.text = character.bio.isEmpty ? "No description" : character.bio

        navigationItem.title = character.name
        
        characterDescription.text = character.bio.isEmpty ? "No description" : character.bio
        characterImage.download(image: character.thumbImage?.fullPath() ?? "")
    }
}
