//
//  ViewController.swift
//  Sticker Madness
//
//  Created by Jeremy Lin on 6/28/16.
//  Copyright © 2016 Jeremy Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var photoTakingHelper: PhotoTakingHelper?
    
    @IBOutlet weak var homePhoto: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func photoButtonPressed(sender: AnyObject) {
        photoTakingHelper = PhotoTakingHelper(viewController: self, callback: { (image) in
            self.homePhoto.image = image
        })
    }
    
    @IBAction func mustachePressed(sender: AnyObject) {
        let mustache = Sticker(image: UIImage(named: "mustache2"))
        self.view.addSubview(mustache)
    }
    
    @IBAction func hatPressed(sender: AnyObject) {
        let hat = Sticker(image: UIImage(named: "hat1"))
        self.view.addSubview(hat)
    }
    
    @IBAction func glassesPressed(sender: AnyObject) {
        let glasses = Sticker(image: UIImage(named: "eyeglasses1"))
        self.view.addSubview(glasses)
    }
    
    @IBAction func cigarPressed(sender: AnyObject) {
        let cigar = Sticker(image: UIImage(named: "cigar"))
        self.view.addSubview(cigar)
    }

}

