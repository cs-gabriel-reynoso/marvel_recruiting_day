//
//  CharacterTableCell.swift
//  Marvel
//
//  Created by Thiago Lioy on 15/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit
import Reusable

final class CharacterTableCell: UITableViewCell, ReusableViewCodeBased {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var thumb: UIImageView!
    
    private var mainStackView: UIStackView!
    private var labelsStackView: UIStackView!
    
    private var characterNameLabel: UILabel!
    private var characterDescLabel: UILabel!
    private var characterThumbImageView: UIImageView!
    
    var needsSetup: Bool = true
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        labelsStackView = UIStackView(arrangedSubviews:
            [
                characterNameLabel,
                characterDescLabel
            ]
        )
        mainStackView = UIStackView(arrangedSubviews:
            [
                characterThumbImageView,
                labelsStackView
            ]
        )
    }
    
    func setupComponents() {
        characterNameLabel = UILabel(frame: .zero)
        characterDescLabel = UILabel(frame: .zero)
        characterThumbImageView = UIImageView(frame: .zero)
    }
    
    func setupAutolayout() {
        
        labelsStackView.distribution = .fill
        labelsStackView.alignment = .fill
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 0
        
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        mainStackView.axis = .horizontal
        mainStackView.spacing = 15
        
        mainStackView.attachToSafeArea(margin: 10)
        
        characterThumbImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        characterThumbImageView.widthAnchor.constraint(equalTo: characterThumbImageView.heightAnchor).isActive = true
    }
    
    func setup(character: Character) {
        characterNameLabel.text = character.name
        characterDescLabel.text = character.bio.isEmpty ? "No description" : character.bio
        characterThumbImageView.download(image: character.thumbImage?.fullPath() ?? "")
        
        name.text = character.name
        characterDescription.text = character.bio.isEmpty ? "No description" : character.bio
        thumb.download(image: character.thumbImage?.fullPath() ?? "")
    }
}
