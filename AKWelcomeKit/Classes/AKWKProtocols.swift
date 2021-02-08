//
//  AKWKProtocols.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 26.01.21.
//

import UIKit

public protocol AKWKDelegate: class {
    
    func wk(_ wk: AKWKController, tapped: Bool, currentPage index: Int)
    func wk(_ wk: AKWKController, tapped index: Int)
}

public extension AKWKDelegate {
    
    func wk(_ wk: AKWKController, tapped: Bool, currentPage index: Int) {}
    func wk(_ wk: AKWKController, tapped index: Int) {}
}

public protocol AKWKDataSource: class {
    
    func wkNumberOfPages(_ wk: AKWKController) -> Int
    func wkBackgroundView(_ wk: AKWKController) -> AKWKBackground?
    func wkPageForIndex(_ wk: AKWKController, index: Int) -> AKWKPage?
    func wkViewForOverlay(_ wk: AKWKController) -> AKWKOverlay?
}

public extension AKWKDataSource {
    
    func wkBackgroundView(_ wk: AKWKController) -> AKWKBackground? {
        return nil
    }
    
    func wkViewForOverlay(_ wk: AKWKController) -> AKWKOverlay? {
        return AKWKOverlay()
    }
}
