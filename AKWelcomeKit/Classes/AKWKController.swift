//
//  AKWKController.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 26.01.21.
//

import UIKit

public class AKWKController: UIViewController {
    
    private weak var delegate: AKWKDelegate?
    private weak var dataSource: AKWKDataSource?
    
    open weak var background: AKWKBackground?
    open weak var overlay: AKWKOverlay?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let wkView = AKWKView()
        wkView.frame = view.frame
        
        wkView.delegate = delegate
        wkView.dataSource = dataSource
        wkView.wkController = self
        
        view.addSubview(wkView)
    }
    
    fileprivate func set(delegate: AKWKDelegate?, dataSource: AKWKDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return AKWKSettings.shared.statusBarStyle
    }
}

public extension UIViewController {
    
    func presentWKController(delegate: AKWKDelegate?, dataSource: AKWKDataSource, animated: Bool, completion: @escaping () -> Void = {}) {
        let wkController = AKWKController()
        
        wkController.set(delegate: delegate, dataSource: dataSource)
        
        wkController.modalPresentationStyle = .fullScreen
        wkController.modalTransitionStyle = AKWKSettings.shared.modalTransitionStyle
        
        AKWKSettings.shared.presentedWKController = wkController
        
        present(wkController, animated: animated, completion: completion)
    }
}
