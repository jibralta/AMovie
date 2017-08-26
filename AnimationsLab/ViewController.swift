//
//  ViewController.swift
//  AnimationsLab
//
//  Created by Joy Umali on 4/18/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var redArrow: UIImageView!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var theEnd: UILabel!
    @IBOutlet weak var pterodactyl: UIImageView!
    @IBOutlet weak var hotAirBalloon: UIImageView!
    @IBOutlet weak var wolf: UIImageView!
    @IBOutlet weak var spider: UIImageView!
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.spider.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //        hotAirBalloon.center.x += view.bounds.width
        //        theEnd.center.x -= view.bounds.width
        //theEnd.center.y -= view.bounds.height
        theEnd.alpha = 0.0
        wolf.alpha = 0.0
        introLabel.center.y += view.bounds.height
        hotAirBalloon.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // intro label to bounce away
        UIView.animate(withDuration: 25.0) {
            self.introLabel.center.y -= self.view.bounds.height
            
        }
        
        // Fade in TheEnd
        UIView.animate(withDuration: 10.0, delay: 25.0, options: .curveLinear, animations: {
            self.theEnd.alpha = 1.0
            
        }, completion: nil)
        
        redArrowBounce()
        
        // Bounce TheEnd In
        //        UIView.animate(withDuration: 15.0, delay: 30.0, usingSpringWithDamping: 0.15, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
        //            self.theEnd.center.x += self.view.bounds.width
        //            self.theEnd.center.y += self.view.bounds.height
        //
        //        }, completion: nil)
        
        // BALLOON
        UIView.animate(withDuration: 20.0, delay: 0, options: .repeat, animations: {
            self.hotAirBalloon.center.x -= self.view.bounds.width
            self.hotAirBalloon.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
            
        }, completion: nil)

        if self.hotAirBalloon.center.x == self.pterodactyl.center.x && self.hotAirBalloon.center.y == self.pterodactyl.center.y {
            launchWolf()
        }
        
        launchWolf()
        launchSpider()

        
    }
    
    // MARK: Custom methods
    func redArrowBounce() {
        UIView.animate(withDuration: 10.0, delay: 0.2, usingSpringWithDamping: 0.05, initialSpringVelocity: 0.4, options: .repeat, animations: {
            self.redArrow.center.y += self.actionButton.bounds.height-10.0
        }, completion: nil)
        
    }
    
    
    // launch wolf when Pterodactyl and Balloon collide
    func launchWolf() {
        UIView.animate(withDuration: 5.0, delay: 2.0, options: .curveLinear, animations: {
            self.wolf.alpha = 1.0
        }, completion: nil)
        
    }
    
    func launchSpider() {
        UIView.animate(withDuration: 500, delay: 5.0, options: .curveLinear, animations: {
            self.spider.transform = CGAffineTransform(scaleX: 500.0, y: 500.00)
        }, completion: nil)
        
        
        UIView.animate(withDuration: 8.0, delay: 5, options: .curveLinear, animations: {
            
        self.spider.center.x -= self.view.bounds.width/2
            self.spider.center.y += self.view.bounds.height
        }, completion: nil)
        
    }
    
    func launchPterodactyl() {
        UIView.animate(withDuration: 15.0, delay: 0.0, options: .transitionCurlUp, animations: {
            
            self.pterodactyl.center.x += self.view.bounds.width
            self.pterodactyl.center.y -= self.view.bounds.height
            
            
        }, completion: nil)
        
    }
    
    // MARK: IBActions
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        launchPterodactyl()
        
    }
}

