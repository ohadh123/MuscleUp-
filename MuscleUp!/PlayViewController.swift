//
//  PlayViewController.swift
//  MuscleUp!
//
//  Created by Etai Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import SwiftyButton

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
        backButton.addTarget(self, action: #selector(backButtonMethod), for: .touchDown)
        backButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(backButton)
    }
    
    func backButtonMethod(){
        print("Back pressed")
        //let viewController = ViewController()
        self.dismiss(animated: true, completion: nil)
    }

    

}
