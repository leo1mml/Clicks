//
//  ImageViewCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 18/09/18.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class ImageViewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    // MARK: - VARIABLES
    
    let scrollViewToZoom : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.zoomScale = 1.0
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - OBJECT LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.scrollViewToZoom.delegate = self
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - SETUP THE VIEWS
    
    private func setupViews() {
        setupScrollView()
        setupPhotoView()
    }
    
    private func setupScrollView() {
        self.addSubview(self.scrollViewToZoom)
        NSLayoutConstraint.activate([
                self.scrollViewToZoom.topAnchor.constraint(equalTo: self.topAnchor),
                self.scrollViewToZoom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.scrollViewToZoom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.scrollViewToZoom.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(recognizer:)))
        doubleTapGesture.numberOfTapsRequired = 2
        self.scrollViewToZoom.addGestureRecognizer(doubleTapGesture)
    }
    
    @objc func handleDoubleTap (recognizer: UITapGestureRecognizer) {
        if scrollViewToZoom.zoomScale == 1 {
            scrollViewToZoom.zoom(to: zoomRectForScale(scale: self.scrollViewToZoom.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
        } else {
            scrollViewToZoom.setZoomScale(1, animated: true)
        }
    }
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = scrollViewToZoom.frame.size.height / scale
        zoomRect.size.width  = scrollViewToZoom.frame.size.width  / scale
        let newCenter = scrollViewToZoom.convert(center, from: photoView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    private func setupPhotoView() {
        self.scrollViewToZoom.addSubview(self.photoView)
        NSLayoutConstraint.activate([
                self.photoView.topAnchor.constraint(equalTo: self.scrollViewToZoom.topAnchor),
                self.photoView.leadingAnchor.constraint(equalTo: self.scrollViewToZoom.leadingAnchor),
                self.photoView.trailingAnchor.constraint(equalTo: self.scrollViewToZoom.trailingAnchor),
                self.photoView.bottomAnchor.constraint(equalTo: self.scrollViewToZoom.bottomAnchor),
                self.photoView.centerXAnchor.constraint(equalTo: self.scrollViewToZoom.centerXAnchor),
                self.photoView.centerYAnchor.constraint(equalTo: self.scrollViewToZoom.centerYAnchor)
            ])
    }
    
    // MARK: - SET DATA METHODS
    
    func setData(data: PhotosSlideScreen.FetchPhotos.ViewModel.Photo){
        self.photoView.image = data.photo
    }
    
    // MARK: - SETUP DELEGATES

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.photoView
    }
}
