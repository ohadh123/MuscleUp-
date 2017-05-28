//
//  ViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitleScreen()
        
        
        
    }

    func setupTitleScreen(){
        view.backgroundColor = .gray
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        titleLabel.center.x = view.frame.width/2
        titleLabel.center.y = view.frame.height/6
        titleLabel.textAlignment = .center
        titleLabel.text = "MuscleUp!"
        titleLabel.font = titleLabel.font.withSize(50)
        view.addSubview(titleLabel)
        
        let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        playButton.center.x = view.frame.width/2
        playButton.center.y = view.frame.height/1.65   //1.518
        playButton.setTitle("Play", for: .normal)
        playButton.backgroundColor = .blue
        playButton.addTarget(self, action: #selector(playButtonMethod), for: .touchDown)
        playButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        view.addSubview(playButton)
        
        let shopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        shopButton.center.x = view.frame.width/2
        shopButton.center.y = view.frame.height/1.455 //1.4
        shopButton.setTitle("Shop", for: .normal)
        shopButton.backgroundColor = .blue
        shopButton.addTarget(self, action: #selector(shopButtonMethod), for: .touchDown)
        shopButton.titleLabel!.font =  UIFont(name: "Verdana", size: 25)
        view.addSubview(shopButton)
        
        let statsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        statsButton.center.x = view.frame.width/2
        statsButton.center.y = view.frame.height/1.3    //1.3
        statsButton.setTitle("Statistics", for: .normal)
        statsButton.backgroundColor = .blue
        statsButton.addTarget(self, action: #selector(statsButtonMethod), for: .touchDown)
        statsButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        view.addSubview(statsButton)
        
        let creditsButton = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        creditsButton.center.x = view.frame.width/8
        creditsButton.center.y = view.frame.height/1.1
        creditsButton.setTitle("Credits", for: .normal)
        creditsButton.backgroundColor = .blue
        creditsButton.addTarget(self, action: #selector(creditsButtonMethod), for: .touchDown)
        view.addSubview(creditsButton)

        
        
    }
    
    func playButtonMethod(){
        print("Play pressed")
        let playViewController = PlayViewController()
        playViewController.modalTransitionStyle = .flipHorizontal
        self.present(playViewController, animated: true, completion: nil)
    }
    
    
    func shopButtonMethod(){
        print("Shop pressed")
        let shopViewController = ShopViewController()
        shopViewController.modalTransitionStyle = .coverVertical
        self.present(shopViewController, animated: true, completion: nil)

    }
    
    func statsButtonMethod(){
        print("Statistics pressed")
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.modalTransitionStyle = .coverVertical
        self.present(statisticsViewController, animated: true, completion: nil)
    }

    
    func creditsButtonMethod(){
        print("Credits Pressed")
        let creditsViewController = CreditsViewController()
        creditsViewController.modalTransitionStyle = .crossDissolve
        self.present(creditsViewController, animated: true, completion: nil)
    }
    


}

