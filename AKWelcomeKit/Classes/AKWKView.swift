//
//  AKWKView.swift
//  WelcomeKit
//
//  Created by Alexey Kostenko on 26.01.21.
//

import UIKit

class AKWKView: UIView, UIScrollViewDelegate {
    
    fileprivate var containerView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        
        return scrollView
    }()
    
    weak var wkController: AKWKController!
    
    open weak var delegate: AKWKDelegate?
    
    open weak var dataSource: AKWKDataSource? {
        didSet {
            dataSourceSet = true
        }
    }
    
    fileprivate var dataSourceSet: Bool = false
    fileprivate var pageCount = 0
    open var shouldSwipe = true
    
    fileprivate var overlay: AKWKOverlay?
    fileprivate var pages = [AKWKPage]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadView() {
        setUpContainerView()
        setUpPages()
        setOverlayView()
        
        containerView.isScrollEnabled = shouldSwipe
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if dataSourceSet {
            loadView()
            dataSourceSet = false
        }
    }
    
    fileprivate func setUpContainerView() {
        self.addSubview(containerView)
        self.containerView.frame = self.frame
        containerView.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPage))
        containerView.addGestureRecognizer(tap)
    }
    
    fileprivate func setUpPages() {
        if let dataSource = dataSource {
            pageCount = dataSource.wkNumberOfPages(wkController)
            for index in 0..<pageCount{
                if let view = dataSource.wkPageForIndex(wkController, index: index) {
                    self.contentMode = .scaleAspectFit
                    containerView.addSubview(view)
                    var viewFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                    viewFrame.origin.x = self.frame.width * CGFloat(index)
                    view.frame = viewFrame
                    self.pages.append(view)
                }
            }
            containerView.contentSize = CGSize(width: self.frame.width * CGFloat(pageCount), height: self.frame.height)
        }
    }
    
    fileprivate func setOverlayView() {
        if let dataSource = dataSource {
            if let overlay = dataSource.wkViewForOverlay(wkController) {
                overlay.page(count: self.pageCount)
                self.addSubview(overlay)
                self.bringSubviewToFront(overlay)
                let viewFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                overlay.frame = viewFrame
                self.overlay = overlay
                self.overlay?.pageControl.addTarget(self, action: #selector(didTapPageControl), for: .valueChanged)
                self.overlay?.continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
            }
        }
    }
    
    @objc internal func tappedPage() {
        let currentpage = Int(getCurrentPosition())
        self.delegate?.wk(wkController, tapped: currentpage)
    }
    
    fileprivate func getCurrentPosition() -> CGFloat {
        let boundsWidth = containerView.bounds.width
        let contentOffset = containerView.contentOffset.x
        let currentPosition = contentOffset / boundsWidth
        
        return currentPosition
    }
    
    @objc private func continueAction() {
        let index = currentPage
        
        delegate?.wk(wkController, continueTapped: index)
        
        guard index < pageCount - 1 else {
            return
        }
        
        goToPage(index: index + 1, animated: true)
    }
    
    @objc open func didTapPageControl(_ sender: Any) {
        let pager = sender as! UIPageControl
        let page = pager.currentPage
        self.goToPage(index: page, animated: true)
    }
    
    open var currentPage: Int{
        return Int(getCurrentPosition())
    }
    
    open func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(getCurrentPosition())
        self.delegate?.wk(wkController, currentPage: currentPage)
    }
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentPosition = Double(getCurrentPosition())
        self.overlay?.currentPage(index: Int(round(currentPosition)))
    }
    
    open func goToPage(index: Int, animated: Bool) {
        if index < self.pageCount {
            let index = CGFloat(index)
            containerView.setContentOffset(CGPoint(x: index * self.frame.width, y: 0), animated: animated)
        }
    }
}
