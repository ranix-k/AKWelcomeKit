//
//  AKWKPage.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 26.01.21.
//

import UIKit

open class AKWKPage: UIView {
        
    @IBOutlet open var imageView: UIImageView! = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFit
        i.translatesAutoresizingMaskIntoConstraints = false
        
        return i
    }()
    
    @IBOutlet open var textLabel: UILabel! = {
        let l = UILabel()
        l.font = AKWKSettings.shared.pageTextFont
        l.textColor = AKWKSettings.shared.pageTextColor
        l.numberOfLines = 0
        l.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean massa."
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    
    private var initialized = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialized = true
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI() {
        guard !initialized else {
            return
        }
        
        initialized = true
        
        backgroundColor = .clear
                
        addSubview(imageView)
        addSubview(textLabel)
                
        let halfHeight: CGFloat = frame.height / 2
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 230),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -(halfHeight - (halfHeight * 0.8))),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
