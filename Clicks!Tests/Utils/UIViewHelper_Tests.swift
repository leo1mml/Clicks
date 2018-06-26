//
//  UIViewHelper_Tests.swift
//  Clicks!Tests
//
//  Created by Leonel Menezes on 25/06/2018.
//  Copyright © 2018 Leonel Menezes. All rights reserved.
//

import XCTest
@testable import Clicks_

class UIViewHelper_Tests: XCTestCase {
    
    var view : UIView?
    
    override func setUp() {
        self.view = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20)))
    }
    
    override func tearDown() {
        self.view = nil
    }
    
    func testDropShadowWithScaleTrue() {
        self.view?.dropShadow(scale: true)
        guard let layer = view?.layer else {
            XCTFail()
            return
        }
        XCTAssert(layer.masksToBounds == false)
        XCTAssert(layer.shadowOpacity == 0.5)
        XCTAssert(layer.shadowColor == UIColor.black.cgColor)
        XCTAssert(layer.shadowOffset == CGSize(width: -1, height: 1))
        XCTAssert(layer.shadowRadius == 1)
        XCTAssert(layer.shouldRasterize == true)
        XCTAssert(layer.rasterizationScale == UIScreen.main.scale)
    }
    
    func testDropShadowWithScaleFalse() {
        self.view?.dropShadow(scale: false)
        guard let layer = view?.layer else {
            XCTFail()
            return
        }
        XCTAssert(layer.masksToBounds == false)
        XCTAssert(layer.shadowOpacity == 0.5)
        XCTAssert(layer.shadowColor == UIColor.black.cgColor)
        XCTAssert(layer.shadowOffset == CGSize(width: -1, height: 1))
        XCTAssert(layer.shadowRadius == 1)
        XCTAssert(layer.shouldRasterize == true)
        XCTAssert(layer.rasterizationScale == 1)
    }
    
    func testDropShadowWithParameters() {
        self.view?.dropShadow(color: UIColor.blue, opacity: 0.3, offSet: CGSize(width: 1, height: 1), radius: 5, scale: true, cornerRadius: 2, borderColor: .gray)
        guard let layer = view?.layer else {
            XCTFail()
            return
        }
        XCTAssert(layer.shadowColor == UIColor.blue.cgColor)
        XCTAssert(layer.shadowOpacity == 0.3)
        XCTAssert(layer.shadowOffset == CGSize(width: 1, height: 1))
        XCTAssert(layer.rasterizationScale == UIScreen.main.scale)
        XCTAssert(layer.shouldRasterize == true)
        XCTAssert(layer.shadowRadius == 5)
        XCTAssert(layer.cornerRadius == 2)
        XCTAssert(layer.borderColor == UIColor.gray.cgColor)
    }
    
    func testImageFromView() {
        guard let view = self.view else {
            XCTFail()
            return
        }
        let image = UIView.image(from: view)
        XCTAssert(image != nil)
    }
    
    func testApplyGradient() {
        guard let view = self.view else {
            XCTFail()
            return
        }
        view.applyGradient(colours: [.black, .white])
        guard let layer = view.layer.sublayers?.first else {
            XCTFail()
            return
        }
        XCTAssert(layer.isKind(of: CAGradientLayer.self))
        let gradientLayer = layer as! CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssert(gradientLayer.colors?.count == 2)
        XCTAssert((gradientLayer.colors?.first as! CGColor) == UIColor.black.cgColor)
        XCTAssert((gradientLayer.colors![1] as! CGColor) == UIColor.white.cgColor)
    }
    
    func testApplyCustomGradient() {
        guard let view = self.view else {
            XCTFail()
            return
        }
        view.applyGradient(colours: [.clear,AppColors.darkGradient.color], locations: [0.325, 1.0])
        guard let layer = view.layer.sublayers?.first else {
            XCTFail()
            return
        }
        let gradientLayer = layer as! CAGradientLayer
        XCTAssertNotNil(gradientLayer)
        XCTAssert(gradientLayer.locations![0] == 0.325)
        XCTAssert(gradientLayer.locations![1] == 1.0)
    }
}
