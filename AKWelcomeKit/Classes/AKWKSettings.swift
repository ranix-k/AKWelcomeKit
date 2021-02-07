//
//  AKWKSettings.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 2.02.21.
//

import UIKit

public class AKWKSettings {
    
    public static let shared = AKWKSettings()
    
    open var presentedWKController: AKWKController?
    
    open var statusBarStyle: UIStatusBarStyle = .lightContent
    open var modalTransitionStyle: UIModalTransitionStyle = .crossDissolve
    
    // MARK: - Overlay
    
    // Continue button
    
    open var overlayContinueText = "Continue"
    open var overlayContinueTextColor = UIColor.white
    open var overlayContinueFont = UIFont.systemFont(ofSize: 17, weight: .medium)
    open var overlayContinueBackgroundColor = UIColor(red: 146/255, green: 89/255, blue: 191/255, alpha: 1.0)
    
    // Page Control
    
    open var overlayCurrentPageIndicatorTintColor: UIColor? = nil
    open var overlayPageIndicatorTintColor: UIColor? = nil
    
    // MARK: - Page
    
    // Text Label
    
    open var pageTextColor = UIColor.white
    open var pageTextFont = UIFont.systemFont(ofSize: 17, weight: .regular)
}
