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
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = 1.0
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    var doubleTapGestureRecognizer: UITapGestureRecognizer!
    
    var photoViewTopConstraint : NSLayoutConstraint?
    var photoViewBottomConstraint : NSLayoutConstraint?
    var photoViewLeadingConstraint : NSLayoutConstraint?
    var photoViewTrailingConstraint : NSLayoutConstraint?
    
    // MARK: - OBJECT LIFE CYCLE
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.scrollViewToZoom.delegate = self
        setupViews()
        self.doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTapWith(gestureRecognizer:)))
        self.doubleTapGestureRecognizer.numberOfTapsRequired = 2
        self.photoView.addGestureRecognizer(self.doubleTapGestureRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateZoomScaleForSize(bounds.size)
    }
    
    override func prepareForReuse() {
        self.photoView.image = nil
    }
    
    // MARK: - SETUP THE VIEWS
    
    private func setupViews() {
        setupScrollView()
        setupPhotoView()
    }
    
    private func setupScrollView() {
        self.addSubview(self.scrollViewToZoom)
        self.scrollViewToZoom.removeConstraints(self.scrollViewToZoom.constraints)
        NSLayoutConstraint.activate([
                self.scrollViewToZoom.topAnchor.constraint(equalTo: self.topAnchor),
                self.scrollViewToZoom.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.scrollViewToZoom.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.scrollViewToZoom.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    private func setupPhotoView() {
        self.scrollViewToZoom.addSubview(self.photoView)
        self.photoViewTopConstraint = self.photoView.topAnchor.constraint(equalTo: self.scrollViewToZoom.topAnchor, constant: 0)
        self.photoViewBottomConstraint = self.photoView.bottomAnchor.constraint(equalTo: self.scrollViewToZoom.bottomAnchor, constant: 0)
        self.photoViewLeadingConstraint = self.photoView.leadingAnchor.constraint(equalTo: self.scrollViewToZoom.leadingAnchor, constant: 0)
        self.photoViewTrailingConstraint = self.photoView.trailingAnchor.constraint(equalTo: self.scrollViewToZoom.trailingAnchor, constant: 0)
        NSLayoutConstraint.activate([
                self.photoViewTopConstraint!,
                self.photoViewBottomConstraint!,
                self.photoViewLeadingConstraint!,
                self.photoViewTrailingConstraint!
            ])
    }
    
    // MARK: - SET DATA METHODS
    
    func setData(data: PhotosSlideScreen.FetchPhotos.ViewModel.Photo){
        self.photoView.image = data.photo
        updateConstraintsForSize(UIScreen.main.bounds.size)
        self.scrollViewToZoom.contentSize = self.photoView.calculateFrameSize(for: UIScreen.main.bounds.size)
        updateZoomScaleForSize(UIScreen.main.bounds.size)
    }
    
    // MARK: - SETUP DELEGATES

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.photoView
    }
    
    @objc func didDoubleTapWith(gestureRecognizer: UITapGestureRecognizer) {
        let pointInView = gestureRecognizer.location(in: self.photoView)
        var newZoomScale = self.scrollViewToZoom.maximumZoomScale
        
        if self.scrollViewToZoom.zoomScale >= newZoomScale || abs(self.scrollViewToZoom.zoomScale - newZoomScale) <= 0.01 {
            newZoomScale = self.scrollViewToZoom.minimumZoomScale
        }
        
        let width = self.scrollViewToZoom.bounds.width / newZoomScale
        let height = self.scrollViewToZoom.bounds.height / newZoomScale
        let originX = pointInView.x - (width / 2.0)
        let originY = pointInView.y - (height / 2.0)
        
        let rectToZoomTo = CGRect(x: originX, y: originY, width: width, height: height)
        self.scrollViewToZoom.zoom(to: rectToZoomTo, animated: true)
    }
    
    func updateZoomScaleForSize(_ size: CGSize) {
        let widthScale = size.width / photoView.bounds.width
        let heightScale = size.height / photoView.bounds.height
        let minScale = min(widthScale, heightScale)
        scrollViewToZoom.minimumZoomScale = minScale
        scrollViewToZoom.zoomScale = minScale
        scrollViewToZoom.maximumZoomScale = minScale * 4
    }
    
    fileprivate func updateConstraintsForSize(_ size: CGSize) {
        
        let yOffset = max(0, (size.height - photoView.frame.height) / 2)
        photoViewTopConstraint!.constant = yOffset
        photoViewBottomConstraint!.constant = yOffset
        
        let xOffset = max(0, (size.width - photoView.frame.width) / 2)
        photoViewLeadingConstraint!.constant = xOffset
        photoViewTrailingConstraint!.constant = xOffset
        
        let contentHeight = yOffset * 2 + self.photoView.frame.height
        
        self.layoutIfNeeded()
        self.scrollViewToZoom.contentSize = CGSize(width: self.scrollViewToZoom.contentSize.width, height: contentHeight)
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(self.bounds.size)
    }
}
