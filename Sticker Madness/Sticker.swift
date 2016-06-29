//
//  Sticker.swift
//  Sticker Madness
//
//  Created by Jeremy Lin on 6/29/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit

class Sticker: UIImageView {
    
    override init(image: UIImage?){
        super.init(image: image)
        self.image = image
        self.userInteractionEnabled = true
        let pan  = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        self.addGestureRecognizer(pan)
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
}
