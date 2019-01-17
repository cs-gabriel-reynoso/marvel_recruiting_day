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
//
//    @IBOutlet weak var characterImage: UIImageView!
//    @IBOutlet weak var characterDescription: UILabel!
    
    private var characterThumbImage: UIImageView = .init(frame: .zero)
    private var darkLayerView: UIView = .init(frame: .zero)
    private var characterDescriptionLabel: UILabel = .init(frame: .zero)
    
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
//        setupView()
    }
    
    func commonInit() {
        setupView()
    }
    
    func setupComponents() {
        view.addSubview(characterThumbImage)
        darkLayerView.addSubview(characterDescriptionLabel)
        view.addSubview(darkLayerView)
        
        darkLayerView.backgroundColor = .black
        darkLayerView.layer.opacity = 0.85
        
        characterThumbImage.contentMode = .top
        characterThumbImage.download(image: character.thumbImage?.fullPath() ?? "https://www.profissionaldeecommerce.com.br/wp-content/uploads/2016/03/mkt-meme-1.jpg")
        
        characterDescriptionLabel.numberOfLines = 0
        characterDescriptionLabel.textColor = .white
        characterDescriptionLabel.textAlignment = .center
        characterDescriptionLabel.text = character.bio.isEmpty ? "No description" : character.bio
        
        navigationItem.title = character.name
    }
    
    func setupAutolayout() {
        characterThumbImage.attachToSafeArea()
        
        darkLayerView.attachToSafeAreaLeftRightAnchors()
        darkLayerView.bottomAnchor.constraint(equalTo: characterThumbImage.bottomAnchor).isActive = true
        darkLayerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        characterDescriptionLabel.attachToSafeArea(margin: 10)
    }
}
