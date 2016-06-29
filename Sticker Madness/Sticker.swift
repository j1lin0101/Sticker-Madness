//
//  Sticker.swift
//  Sticker Madness
//
//  Created by Jeremy Lin on 6/29/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit

class Sticker: UIImageView, UIGestureRecognizerDelegate {
    
    override init(image: UIImage?){
        super.init(image: image)
        self.image = image
        self.userInteractionEnabled = true
        let pan  = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        pan.delegate = self
        self.addGestureRecognizer(pan)
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:)))
        pinch.delegate = self
        self.addGestureRecognizer(pinch)
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotate(_:)))
        rotate.delegate = self
        self.addGestureRecognizer(rotate)
        
        
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(image: nil)
    }

    func handlePan(panGestureRecognizer: UIPanGestureRecognizer!){
        if panGestureRecognizer.state == .Began || panGestureRecognizer.state == .Changed {
            let translation = panGestureRecognizer.translationInView(panGestureRecognizer.view)
            
            if let view = panGestureRecognizer.view {
                let affinerTransformTranslate = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
                view.transform = affinerTransformTranslate
                panGestureRecognizer.setTranslation(CGPointZero, inView: view)
            }
            else {
                print("no view")
            }
        }
    }
    
    func handlePinch(pinchGestureRecognizer : UIPinchGestureRecognizer!) {
        if let view = pinchGestureRecognizer.view {
            view.transform = CGAffineTransformScale(view.transform,
                                                    pinchGestureRecognizer.scale, pinchGestureRecognizer.scale)
            pinchGestureRecognizer.scale = 1
        }
    }
    
    func handleRotate(rotateGestureRecognizer : UIRotationGestureRecognizer) {
        if let view = rotateGestureRecognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, rotateGestureRecognizer.rotation)
            rotateGestureRecognizer.rotation = 0
        }
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
