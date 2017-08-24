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
    @IBOutlet weak var pterodactyl: UIImageView!
    @IBOutlet weak var hotAirBalloon: UIImageView!
    
    // MARK: Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hotAirBalloon.center.x += view.bounds.width
        hotAirBalloon.center.x -= view.bounds.width

    }

    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 20.0) {
            self.hotAirBalloon.center.x -= self.view.bounds.width // essentially undoing what happened in viewwillAppear.  Need self because in a closure
        }
        
        // increase size of hotAirBalloon. 
        
        
        UIView.animate(withDuration: 10.0, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 25, options: .autoreverse, animations: {
            self.pterodactyl.center.x -= self.view.bounds.width
            
        }, completion: nil)
        

        
    }

    // MARK: IBActions
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        // dino moves 
        
        
    }
}

