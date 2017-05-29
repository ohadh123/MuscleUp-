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
import StepProgressBar
import PopupCollectionViewController
import Bottomsheet


class ViewController: UIViewController {

    var confettiView = SAConfettiView()
    var confettiView2 = SAConfettiView()
    var confettiView3 = SAConfettiView()
    var confettiIsActive: Bool = false
    
    var characterBarDouble: CGFloat = 0.0
    var characterBarDoubleFromSave: CGFloat = 0.0
    var characterBar: GTProgressBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 15))
    
    var energyDouble: Int = 10
    var energyBar1: StepProgressBar = StepProgressBar(frame: CGRect(x: 0, y: 0, width: 80, height: 7))
    var energyBar2: StepProgressBar = StepProgressBar(frame: CGRect(x: 0, y: 0, width: 80, height: 7))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitleScreen()
        
        
        
    }

    func setupTitleScreen(){
        view.backgroundColor = .gray
        
        
        createTitleLabel()
        createHomeScreenButtons()
        createSlider()
        addConfettiViews()
        
        
        
    }
    
    func createTitleLabel(){
        /**let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        titleLabel.center.x = view.frame.width/2
        titleLabel.center.y = view.frame.height/6
        titleLabel.textAlignment = .center
        titleLabel.text = "MuscleUp!"
        titleLabel.font = titleLabel.font.withSize(50)
        view.addSubview(titleLabel)**/
        
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        titleImageView.center.x = view.frame.width/2
        titleImageView.center.y = view.frame.height/12   //6
        titleImageView.image = #imageLiteral(resourceName: "MuscleUp!")
        view.addSubview(titleImageView)
    }
    
    func createHomeScreenButtons(){
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
    }
    
    func addConfettiViews(){
        confettiView = SAConfettiView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        confettiView.intensity = 1
        view.addSubview(confettiView)
        
        confettiView2 = SAConfettiView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        confettiView2.intensity = 1
        view.addSubview(confettiView2)
        
        confettiView3 = SAConfettiView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3))
        confettiView3.intensity = 1
        view.addSubview(confettiView3)
    }
    
    func createSlider(){
        
        //characterBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
        characterBar.center.x = view.frame.width/2
        characterBar.center.y = view.frame.height/5.5
        characterBar.progress = characterBarDoubleFromSave
        characterBar.barBorderColor = .blue
        characterBar.barBackgroundColor = .gray
        characterBar.barFillColor = .blue
        characterBar.barFillInset = 0.4
        characterBar.displayLabel = false
        //characterBar.cornerRadius = 5
        view.addSubview(characterBar)
        
        let characterBarLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        characterBarLabel.center.x = view.frame.width/2
        characterBarLabel.center.y = view.frame.height/6.3
        characterBarLabel.textAlignment = .center
        characterBarLabel.text = "Strength:"
        characterBarLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        //characterBarLabel.font = characterBarLabel.font.withSize(14)
        view.addSubview(characterBarLabel)
        
        
        //let energyBar = StepProgressBar(frame: CGRect(x: 0, y: 0, width: 80, height: 5))
        
        

    }
    
    func playButtonMethod(){
        print("Play pressed")
        let playViewController = PlayViewController()
        playViewController.modalTransitionStyle = .flipHorizontal
        self.present(playViewController, animated: true, completion: nil)
        
    }
    
    func shopButtonMethod(){
        print("Shop pressed")
        
        /**let popupVC = PopupCollectionViewController(fromVC: self)
        popupVC.presentViewControllers([ShopViewController(), ShopViewControllerTwo()], completion: nil)**/
        
        
        
        /**let popupVC = PopupCollectionViewController(fromVC: self)
        let shopViewFirst = ShopViewController()
        let shopViewSecond = ShopViewControllerTwo()
        let shopViewThird = ShopViewControllerThree()
        
        
        popupVC.presentViewControllers([shopViewFirst, shopViewSecond, shopViewThird],
                                       options: [
                                        .cellWidth(self.view.bounds.width/1.5),
                                        .popupHeight(400),
                                        .contentEdgeInsets(20),
                                        .layout(.center),
                                        .animation(.slideUp),
                                        
                                        
            ],
                                       completion: nil)**/
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
            startConfetti()
            confettiIsActive = true
            
        }
        
    }
    
    func stopConfetti(){
        confettiView.stopConfetti()
        confettiView2.stopConfetti()
        confettiView3.stopConfetti()
    }
    
    func startConfetti(){
        confettiView.startConfetti()
        confettiView2.startConfetti()
        confettiView3.startConfetti()

    }
    
    func musicToggleMethod(){
        print("Music Toggled")
        characterBarDouble += 0.1
        
        characterBar.animateTo(progress: characterBarDouble)
        
    }
    


}

