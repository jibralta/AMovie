//
//  ViewController.swift
//  AnimationsLab
//
//  Created by Joy Umali on 4/18/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pterodactyl: UIImageView!
    
    @IBOutlet weak var hotAirBalloon: UIImageView!
    
    @IBOutlet weak var wolf: UIImageView!
    
    @IBOutlet weak var spider: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.spider.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hotAirBalloon.center.x += view.bounds.width
        
        wolf.alpha = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 20.0) {
            self.hotAirBalloon.center.x -= self.view.bounds.width
            self.hotAirBalloon.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
            
        }
        
        UIView.animate(withDuration: 30.0) {
            self.spider.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            
        }
        
        UIView.animate(withDuration: 100.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {
            self.spider.center.x -= self.view.bounds.width
            self.spider.center.y += self.view.bounds.height
        }, completion: nil)
        
        launchWolf()
        
        if self.hotAirBalloon.center.x == self.pterodactyl.center.x && self.hotAirBalloon.center.y == self.pterodactyl.center.y {
            launchWolf()
        }
        
        
    }
    
    
    // launch wolf when Pterodactyl and Balloon collide
    func launchWolf() {
        UIView.animate(withDuration: 25.0) {
            
            self.wolf.alpha = 1.0
            //            self.wolf.center.x
        }
        
    }
    
    
    func launchPterodactyl() {
        UIView.animate(withDuration: 10.0, animations: {
            self.pterodactyl.center.x += self.view.bounds.width
            self.pterodactyl.center.y -= self.view.bounds.width
            
            
        }, completion: nil)
        
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        launchPterodactyl()
        
    }
}

