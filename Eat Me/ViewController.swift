//
//  ViewController.swift
//  Eat Me
//
//  Created by Alper Başak on 15.12.2018.
//  Copyright © 2018 Alper Başak. All rights reserved.
//

import UIKit
import LTMorphingLabel
import AVFoundation

class ViewController: UIViewController {

    var degreeLbl = 0
    var degreeImg = 0
    let duration = 1.5
    var avPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label: LTMorphingLabel!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.path(forResource: "eatme", ofType: "m4a")
        
        do{
            try avPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        }catch{
            print(error)
        }
    }
    
    @IBAction func tapCoord(_ sender: Any) {
        
        label.center=tapGesture.location(in: self.view)
        img.center=tapGesture.location(in: self.view)
        label.text=""
        label.alpha=1.0
        img.alpha=1.0
        UIView.animate(withDuration: duration) {
            self.avPlayer.play()
            self.label.morphingEffect = .fall
            self.label.text="EAT ME"
            self.degreeLbl=Int.random(in: -180..<180)
            self.degreeImg=Int.random(in: -180..<180); self.label.transform=CGAffineTransform(rotationAngle: CGFloat(self.degreeLbl))
             self.img.transform=CGAffineTransform(rotationAngle: CGFloat(self.degreeImg))
            self.label.alpha = 0.0
            self.img.alpha=0.0
        }
        
    }
}

