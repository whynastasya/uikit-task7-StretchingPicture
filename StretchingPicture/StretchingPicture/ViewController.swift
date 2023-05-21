//
//  ViewController.swift
//  StretchingPicture
//
//  Created by nastasya on 20.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupImageView()
    }
    
    private func setupScrollView() {
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height + 100)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 270, left: 0, bottom: 0, right: 0)
        scrollView.delegate = self
        view.addSubview(scrollView)
    }
    
    private func setupImageView() {
        imageView.frame = CGRectMake(0, 0, view.bounds.width, 270)
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleToFill
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY < 0 {
            imageView.frame = CGRectMake(0, contentOffsetY, view.bounds.width, 270 + view.safeAreaInsets.top - contentOffsetY)
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 270 - contentOffsetY, left: 0, bottom: 0, right: 0)
        }
    }
}
