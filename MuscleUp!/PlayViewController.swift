//
//  PlayViewController.swift
//  MuscleUp!
//
//  Created by Etai Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import SAConfettiView
import JSSAlertView
import SwiftyButton
import TKSwitcherCollection
import GTProgressBar
import MaterialMotion
import StepProgressBar
import LTMorphingLabel


class PlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupPlayScreen()
    }
    
    func setupPlayScreen(){
        view.backgroundColor = .orange
        
        let backButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 75, height: 40))
        backButton.center.x = view.frame.width/8
        backButton.center.y = view.frame.height/10
        backButton.setTitle("Back", for: .normal)
        //backButton.backgroundColor = .blue
        backButton.shadowHeight = 4
        backButton.addTarget(self, action: #selector(backButtonMethod), for: .touchUpInside)
        backButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(backButton)
        
        createFourButtons()
        createTitleLabel()
    }
    
    func createFourButtons(){
        let pullUpButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        pullUpButton.center.x = view.frame.width/4
        pullUpButton.center.y = view.frame.height/2.2
        pullUpButton.setTitle("Pull-Ups", for: .normal)
        pullUpButton.addTarget(self, action: #selector(pullUpButtonMethod), for: .touchUpInside)
        pullUpButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        pullUpButton.shadowHeight = 8
        view.addSubview(pullUpButton)
        
        let curlsButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        curlsButton.center.x = view.frame.width/1.37
        curlsButton.center.y = view.frame.height/2.2
        curlsButton.setTitle("Curls", for: .normal)
        curlsButton.addTarget(self, action: #selector(curlsButtonMethod), for: .touchUpInside)
        curlsButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        curlsButton.shadowHeight = 8
        view.addSubview(curlsButton)
        
        let squatsButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        squatsButton.center.x = view.frame.width/4
        squatsButton.center.y = view.frame.height/1.35
        squatsButton.setTitle("Squats", for: .normal)
        squatsButton.addTarget(self, action: #selector(squatsButtonMethod), for: .touchUpInside)
        squatsButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        squatsButton.shadowHeight = 8
        view.addSubview(squatsButton)
        
        let sitUpsButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        sitUpsButton.center.x = view.frame.width/1.37
        sitUpsButton.center.y = view.frame.height/1.35
        sitUpsButton.setTitle("Sit-Ups", for: .normal)
        sitUpsButton.addTarget(self, action: #selector(sitUpsButtonMethod), for: .touchUpInside)
        sitUpsButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        sitUpsButton.shadowHeight = 8
        view.addSubview(sitUpsButton)
        
    }
    
    func createTitleLabel(){
         let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
         titleLabel.center.x = view.frame.width/2
         titleLabel.center.y = view.frame.height/4
         titleLabel.textAlignment = .center
         titleLabel.text = "Excercises"
         titleLabel.font = titleLabel.font.withSize(50)
         view.addSubview(titleLabel)
    }
    
    func pullUpButtonMethod(){
        print("Pullups pressed")
    }
    
    func curlsButtonMethod(){
        print("Curls pressed")
    }
    
    func squatsButtonMethod(){
        print("Squats pressed")
    }
    
    func sitUpsButtonMethod(){
        print("Situps pressed")
    }
    
    func backButtonMethod(){
        print("Back pressed")
        //let viewController = ViewController()
        self.dismiss(animated: true, completion: nil)
    }

    

}
