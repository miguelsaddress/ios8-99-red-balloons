//
//  ViewController.swift
//  99RedBalloons
//
//  Created by MIGUEL ANGEL MORENO ARMENTEROS on 13/10/14.
//  Copyright (c) 2014 MIGUEL ANGEL MORENO ARMENTEROS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberBalloonsLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var balloons:[Balloon] = []
    var currentIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.randomizeBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showNextBalloonPressed(sender: UIBarButtonItem) {
        currentIndex++
        if currentIndex > 98 {
         currentIndex = 0
        }
        
        let balloonToShow = self.balloons[currentIndex]
        self.backgroundImageView.image = UIImage(named: balloonToShow.imgFile)
        self.numberBalloonsLabel.text = "\(balloonToShow.number) Balloons"
    }

    private func randomizeBalloons(){
        let pictures = ["RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
        for i in 1...99 {
            let randomPictureIndex = Int(arc4random_uniform(UInt32(pictures.count)))
            let balloon = Balloon(number: i, imgFile: pictures[randomPictureIndex])
            self.balloons.append(balloon)
        }
        
    }
    
}

