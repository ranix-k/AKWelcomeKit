//
//  ViewController.swift
//  AKWelcomeKit
//
//  Created by Alexey on 02/07/2021.
//  Copyright (c) 2021 Alexey. All rights reserved.
//

import UIKit
import AKWelcomeKit

class ViewController: UIViewController, AKWKDataSource, AKWKDelegate {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentWKController(delegate: self, dataSource: self, animated: true)
    }
    
    // DataSource

    func wkNumberOfPages(_ wk: AKWKController) -> Int {
        return 3
    }
    
    func wkPageForIndex(_ wk: AKWKController, index: Int) -> AKWKPage? {
        let page = AKWKPage()
        
        page.imageView.image = UIImage(named: "ic_w_1")
        page.textLabel.text = "index \(index)"
        
        return page
    }
    
    // Delegate
    
    func wk(_ wk: AKWKController, continueTapped pageIndex: Int) {
        guard pageIndex == 2 else {
            return
        }
        
        wk.dismiss(animated: true, completion: nil)
    }
}
