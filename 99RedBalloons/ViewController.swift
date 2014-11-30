//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Mac on 11/29/14.
//  Copyright (c) 2014 Eduardo Furtado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var balloonLabel: UILabel!

    //Amount of balloon images in assets
    let amountOfImages = 4
    
    //Amount of balloons to create and show
    let amountOfBalloons = 99
    
    var i = 0, lastRandom = 0
    var balloons:[Balloon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createBallons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func nextBarButtonPressed(sender: UIBarButtonItem) {
        if i < amountOfBalloons {
            UIView.transitionWithView(self.view, duration: 1, options:UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                
                self.imageView.image = self.balloons[self.i].image
                self.balloonLabel.text = "Balloon #\(self.balloons[self.i].number)"
                
                }, completion: {
                    (finished:Bool) -> () in
            })
            i++
        }
        
        else {
            UIView.transitionWithView(self.view, duration: 1, options:UIViewAnimationOptions.TransitionCrossDissolve, animations: {
                
                self.imageView.image = UIImage(named: "BerlinTVTower.jpg")
                self.balloonLabel.text = "Balloons"
                
                }, completion: {
                    (finished:Bool) -> () in
            })
            i = 0
        }
    }
    
    func createBallons() {
        var random:Int
        var balloon = Balloon()
        
        for var index = 0; index < amountOfBalloons; index++ {
            do {
                random = Int(arc4random_uniform(UInt32(amountOfImages))) + 1
            } while random == lastRandom
            lastRandom = random
            
            //DOES NOT WORK
            //balloons[0].number = 1
            //balloons[i].number = self.i+1
            //balloons[i].image = UIImage(named: "RedBalloon\(random).jpg")
            
            balloon.number = index+1
            balloon.image = UIImage(named: "RedBalloon\(random).jpg")
            
            balloons.append(balloon)
        }
    }

}

