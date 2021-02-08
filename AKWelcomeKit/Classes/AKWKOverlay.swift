//
//  AKWKOverlay.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 26.01.21.
//

import UIKit

open class AKWKOverlay: UIView {
    
    @IBOutlet open var pageControl: UIPageControl! = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = AKWKSettings.shared.overlayCurrentPageIndicatorTintColor
        pageControl.pageIndicatorTintColor = AKWKSettings.shared.overlayPageIndicatorTintColor
        pageControl.translatesAutoresizingMaskIntoConstraints = false

        return pageControl
    }()
    
    @IBOutlet open var continueButton: UIButton! = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 7
        button.titleLabel?.font = AKWKSettings.shared.overlayContinueFont
        button.setTitleColor(AKWKSettings.shared.overlayContinueTextColor, for: .normal)
        button.backgroundColor = AKWKSettings.shared.overlayContinueBackgroundColor
        button.setTitle(AKWKSettings.shared.overlayContinueText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var initialized = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialized = true
    }
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.alpha > 0 && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
    
    open func page(count: Int) {
        pageControl.numberOfPages = count
    }
    
    open func currentPage(index: Int) {
        pageControl.currentPage = index
    }
    
    func setupUI() {
        guard !initialized else {
            return
        }
        
        initialized = true
        
        backgroundColor = .clear
        
        addSubview(pageControl)
        addSubview(continueButton)
                
        let margin = layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            pageControl.heightAnchor.constraint(equalToConstant: 15),
            pageControl.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20),
            pageControl.centerXAnchor.constraint(equalTo: margin.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20),
            continueButton.centerXAnchor.constraint(equalTo: margin.centerXAnchor),
            continueButton.widthAnchor.constraint(equalTo: margin.widthAnchor, constant: -80)
        ])
    }
}
