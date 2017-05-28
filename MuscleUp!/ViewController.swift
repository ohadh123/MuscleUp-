//
//  ViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import SAConfettiView
import JSSAlertView
import SwiftyButton
import TKSwitcherCollection
import GTProgressBar
import MaterialMotion

class ViewController: UIViewController {

    var confettiView = SAConfettiView()
    var confettiView2 = SAConfettiView()
    var confettiView3 = SAConfettiView()
    var confettiIsActive: Bool = false
    var characterBarDouble: CGFloat = 0.0
    var characterBarDoubleFromSave: CGFloat = 0.0
    var characterBar: GTProgressBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 15))
    var coinAmount: Int = 500
    
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
        
        //let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let playButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        playButton.center.x = view.frame.width/2
        playButton.center.y = view.frame.height/1.65   //1.518
        playButton.setTitle("Play", for: .normal)
        //playButton.backgroundColor = .blue
        playButton.addTarget(self, action: #selector(playButtonMethod), for: .touchUpInside)
        playButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        
        /**let playFirstColor = UIColor(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)
        let playSecondColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0.6, alpha: 1)
        playButton.colors = .init(button: playFirstColor, shadow: playSecondColor)
        playButton.shadowHeight = 5
        playButton.cornerRadius = 5**/
        playButton.shadowHeight = 4
        view.addSubview(playButton)
        
        let shopButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        shopButton.center.x = view.frame.width/2
        shopButton.center.y = view.frame.height/1.455 //1.4
        shopButton.setTitle("Shop", for: .normal)
        //shopButton.backgroundColor = .blue
        shopButton.addTarget(self, action: #selector(shopButtonMethod), for: .touchUpInside)
        shopButton.titleLabel!.font =  UIFont(name: "Verdana", size: 25)
        shopButton.shadowHeight = 4
        view.addSubview(shopButton)
        
        let statsButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        statsButton.center.x = view.frame.width/2
        statsButton.center.y = view.frame.height/1.3    //1.3
        statsButton.setTitle("Statistics", for: .normal)
        //statsButton.backgroundColor = .blue
        statsButton.addTarget(self, action: #selector(statsButtonMethod), for: .touchUpInside)
        statsButton.titleLabel!.font =  UIFont(name: "Verdana", size: 20)
        statsButton.shadowHeight = 4
        view.addSubview(statsButton)
        
        let creditsButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        creditsButton.center.x = view.frame.width/8
        creditsButton.center.y = view.frame.height/1.1
        creditsButton.setTitle("Credits", for: .normal)
        //creditsButton.backgroundColor = .blue
        creditsButton.addTarget(self, action: #selector(creditsButtonMethod), for: .touchUpInside)
        creditsButton.shadowHeight = 4
        view.addSubview(creditsButton)
        
        let confettiButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        confettiButton.center.x = view.frame.width/2
        confettiButton.center.y = view.frame.height/1.1
        confettiButton.setTitle("Confetti", for: .normal)
        //confettiButton.backgroundColor = .blue
        confettiButton.addTarget(self, action: #selector(confettiButtonMethod), for: .touchDown)
        
        confettiView = SAConfettiView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        confettiView.intensity = 1
        view.addSubview(confettiView)
        
        confettiView2 = SAConfettiView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        confettiView2.intensity = 1
        view.addSubview(confettiView2)
        
        confettiView3 = SAConfettiView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        confettiView3.intensity = 1
        view.addSubview(confettiView3)
        
        view.addSubview(confettiButton)
        
        let musicToggle = TKSimpleSwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        musicToggle.center.x = view.frame.width/1.2
        musicToggle.center.y = view.frame.height/1.1
        musicToggle.addTarget(self, action: #selector(musicToggleMethod), for: .touchDown)
        
        let volumeImagePic = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        volumeImagePic.image = #imageLiteral(resourceName: "volumeImage")
        volumeImagePic.center.x = view.frame.width/1.06
        volumeImagePic.center.y = view.frame.height/1.1
        
        view.addSubview(musicToggle)
        view.addSubview(volumeImagePic)
        
        //characterBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
        characterBar.center.x = view.frame.width/2
        characterBar.center.y = view.frame.height/12
        characterBar.progress = characterBarDoubleFromSave
        characterBar.barBorderColor = .blue
        characterBar.barBackgroundColor = .gray
        characterBar.barFillColor = .blue
        characterBar.barFillInset = 0.4
        characterBar.displayLabel = false
        //characterBar.cornerRadius = 5
        
        view.addSubview(characterBar)
        
        let coinImagePic = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        coinImagePic.image = #imageLiteral(resourceName: "Bitcoin")
        coinImagePic.center.x = view.frame.width/1.2
        coinImagePic.center.y = view.frame.height/12
        
        let coinLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
        coinLabel.center.x = view.frame.width/1.09
        coinLabel.center.y = view.frame.height/12
        coinLabel.textAlignment = .center
        coinLabel.text = String(coinAmount)
        coinLabel.font = titleLabel.font.withSize(20)
        view.addSubview(coinLabel)
        
        
        
        view.addSubview(coinImagePic)
        

        
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
    
    func confettiButtonMethod(){
        print("Confetti pressed")
        
        JSSAlertView().show(
            self,
            title: "Congratulations! You Muscled Up!",
            text: "You reached Level 3 in Upper Body Workout. Gnarly!",
            buttonText: "Right on!",
            color: .cyan,
            iconImage: #imageLiteral(resourceName: "CongratsStar")
            //delay: 10000
        )
        
        if confettiIsActive {
            stopConfetti()
            confettiIsActive = false
            
        }
        else{
            confettiView.startConfetti()
            confettiView2.startConfetti()
            confettiView3.startConfetti()
            confettiIsActive = true
            
        }
        
    }
    
    func stopConfetti(){
        confettiView.stopConfetti()
        confettiView2.stopConfetti()
        confettiView3.stopConfetti()
    }
    
    func musicToggleMethod(){
        print("Music Toggled")
        characterBarDouble += 0.1
        characterBar.animateTo(progress: characterBarDouble)
        
    }
    


}

