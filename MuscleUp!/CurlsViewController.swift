//
//  CurlsViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 7/8/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class CurlsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    override func loadView() {
        self.view = SKView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene(fileNamed: "GameScene") {
            // Configure the view.
            let skView = view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            scene.viewController = self
            skView.presentScene(scene)
        }
    }
}
