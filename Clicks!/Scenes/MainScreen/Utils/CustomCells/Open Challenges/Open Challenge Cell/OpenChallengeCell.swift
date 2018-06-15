//
//  ChallengeCell.swift
//  Clicks!
//
//  Created by Leonel Menezes on 13/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import Foundation
import UIKit

class OpenChallengeCell : UICollectionViewCell {
    
    var context = CIContext(options: nil)
    
    let shadowView : UIImageView = {
        let shadowView = UIImageView()
        shadowView.contentMode = .scaleAspectFill
        shadowView.clipsToBounds = true
        shadowView.layer.cornerRadius = 15
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    let coverImage : UIImageView = {
        let coverImage = UIImageView()
        coverImage.clipsToBounds = true
        coverImage.contentMode = .scaleAspectFill
        coverImage.translatesAutoresizingMaskIntoConstraints = false
        coverImage.layer.cornerRadius = 10
        return coverImage
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = AppColors.darkwhite.color
        setupShadowView()
        setupCoverImage()
//        applyBlurEffect()
    }
    
    func setImage(image: UIImage) {
        self.coverImage.image = image
        self.shadowView.image = image
        DispatchQueue.main.async {
            self.applyBlurEffect()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCoverImage() {
        self.addSubview(self.coverImage)
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: self.topAnchor),
            coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            coverImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3)
            ])
        self.coverImage.layer.zPosition = 100
    }
    
    func setupShadowView() {
        self.shadowView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.shadowView)
        NSLayoutConstraint.activate([
            self.shadowView.topAnchor.constraint(equalTo: self.topAnchor),
            self.shadowView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15),
            self.shadowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            self.shadowView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
        self.shadowView.layer.zPosition = -30
    }
    
    func applyBlurEffect(){
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let framedImage = image(with: self)
        let beginImage = CIImage(image: framedImage!)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(6.5, forKey: "inputRadius")
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        shadowView.image = processedImage
    }
    
    func image(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
    
}
