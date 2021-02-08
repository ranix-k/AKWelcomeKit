//
//  AKWKProtocols.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 26.01.21.
//

import UIKit

public protocol AKWKDelegate: class {
    
    func wk(_ wk: AKWKController, currentPage index: Int)
    func wk(_ wk: AKWKController, tapped index: Int)
    func wk(_ wk: AKWKController, continueTapped pageIndex: Int)
}

public extension AKWKDelegate {
    
    func wk(_ wk: AKWKController, currentPage index: Int) {}
    func wk(_ wk: AKWKController, tapped index: Int) {}
    func wk(_ wk: AKWKController, continueTapped pageIndex: Int) {}
}

public protocol AKWKDataSource: class {
    
    func wkNumberOfPages(_ wk: AKWKController) -> Int
    func wkPageForIndex(_ wk: AKWKController, index: Int) -> AKWKPage?
    func wkViewForOverlay(_ wk: AKWKController) -> AKWKOverlay?
}

public extension AKWKDataSource {
    
    func wkViewForOverlay(_ wk: AKWKController) -> AKWKOverlay? {
        return AKWKOverlay()
    }
}

public protocol WKOverlayProtocol {
    
    var pageControl: UIPageControl { get set }
    var continueButton: UIButton { get set }
}
