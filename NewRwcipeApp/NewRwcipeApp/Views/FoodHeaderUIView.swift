//
//  FoodHeaderUIView.swift
//  NewRwcipeApp
//
//  Created by Gizem Turker on 3.08.2022.
//

import UIKit

class FoodHeaderUIView: UIView {
    
    private let likeButton:UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Add list", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    private let foodImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "foodImage")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(foodImageView)
        addGradient()
        addSubview(likeButton)
        applyConstraints()
        
    }
    
    private func applyConstraints() {
        
        let likeButtonConstraints = [
            likeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            likeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            
            //likeButton.widthAnchor.constraint(equalTo: 50)
            
        ]
        
        NSLayoutConstraint.activate(likeButtonConstraints)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImageView.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
