//
//  CreditsViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import CoreData
import UIKit
import SwiftyButton

class CreditsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCreditsScreen()
    }
    
    func setupCreditsScreen(){
        createBackgroundImage()
        
        let backButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 75, height: 40))
        backButton.center.x = view.frame.width/8
        backButton.center.y = view.frame.height/10
        backButton.setTitle("Back", for: .normal)
        //backButton.backgroundColor = .blue
        backButton.shadowHeight = 4
        backButton.addTarget(self, action: #selector(backButtonMethod), for: .touchUpInside)
        backButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(backButton)
    }
    
    func createBackgroundImage(){
        let backImage = #imageLiteral(resourceName: "SkyBackNoCloud")
        let backImageResize = ViewController.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        //backImage.height = view.frame.width
        self.view.backgroundColor = UIColor(patternImage: backImageResize)
        
        
        
    }
    
    func backButtonMethod(){
        print("Back pressed")
        self.dismiss(animated: true, completion: nil)
    }
}
