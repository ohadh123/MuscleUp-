//
//  ViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import CoreData
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
import SpriteKit
import AVFoundation

enum GenericError: Error {
    case musicError
}
class ViewController: UIViewController {

    var titleImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    
    var characterBarLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
    var characterBarDouble: CGFloat = 0.0
    var characterBar: GTProgressBar = GTProgressBar(frame: CGRect(x: 0, y: 0, width: 200, height: 13))
    
    var playButton:PressableButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 175, height: 65))
    var shopButton:PressableButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    var statsButton:PressableButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
    var creditsButton:PressableButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 85, height: 40))
    
    var musicToggle:TKSimpleSwitch = TKSimpleSwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
    var volumeImagePic:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    var playingMusic: Bool = true
    static var backgroundMusicPlayer: AVAudioPlayer = AVAudioPlayer()
    
    var leftArmImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var rightArmImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var upperBodyImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var coreImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var legsImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var shortsImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    var headImage: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    var armStepper:UIStepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 50, height: 75))
    var upperBodyStepper:UIStepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 50, height: 75))
    var coreStepper:UIStepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 50, height: 75))
    var legsStepper:UIStepper = UIStepper(frame: CGRect(x: 0, y: 0, width: 50, height: 75))
    
    static var upperBodyLevel: Int = 0
    static var coreLevel: Int = 0
    static var armLevel: Int = 0
    static var legLevel: Int = 0
    
    var confettiView = SAConfettiView()
    var confettiView2 = SAConfettiView()
    var confettiView3 = SAConfettiView()
    var confettiIsActive: Bool = false
    
    var firstTimeOpeningApp: Bool = true
    
    
    // MARK: viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        if firstTimeOpeningApp {
        super.viewWillAppear(animated)
        titleImageView.center.y -= view.bounds.width
        characterBarLabel.alpha = 0.0
        characterBar.alpha = 0.0
        
        playButton.center.x -= view.bounds.width
        shopButton.center.x += view.bounds.width
        statsButton.center.x -= view.bounds.width
        creditsButton.center.y += view.bounds.width
        musicToggle.alpha = 0
        volumeImagePic.alpha = 0
        }
        
    }

    // MARK: viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
        if firstTimeOpeningApp{
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.titleImageView.center.y += self.view.bounds.width
        
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveLinear, animations: {
            self.characterBarLabel.alpha = 1
            self.characterBar.alpha = 1
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 0.8, options: UIViewAnimationOptions.curveLinear, animations: {
            self.playButton.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.shopButton.center.x -= self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 1.2, options: UIViewAnimationOptions.curveLinear, animations: {
            self.statsButton.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.2, delay: 1.5, options: UIViewAnimationOptions.curveLinear, animations: {
            self.creditsButton.center.y -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.6, delay: 1.85, options: UIViewAnimationOptions.curveLinear, animations: {
            self.musicToggle.alpha = 1
            self.volumeImagePic.alpha = 1

            self.view.layoutIfNeeded()
        }, completion: nil)
            }
        
        setupCharacterImage()
        animateTitleCharacterSequence()
    
    }
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreDataRetrieval()
        setupLevelSliders()
        setupTitleScreen()
        
        print(view.frame.height)
        print(view.frame.width)
        
    }
    
    // MARK: Core Data Methods
    
    func coreDataRetrieval(){
        //Dangerous code: Do not use otherwise else character's stats will be wiped
        
        if AppDelegate.isFirstTimeLaunching{
            let characterStats: CharacterStats = NSEntityDescription.insertNewObject(forEntityName: "CharacterStats", into: DatabaseController.getContext()) as! CharacterStats
            characterStats.upperBodyLevelFromSave = 1
            characterStats.coreLevelFromSave = 1
            characterStats.armLevelFromSave = 1
            characterStats.legsLevelFromSave = 1
        
            DatabaseController.saveContext()
        }

        let fetchRequest:NSFetchRequest<CharacterStats> = CharacterStats.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            var searchResultsCount = searchResults.count
            
            for result in searchResults as [CharacterStats]{
                //result.setValue(3, forKey: "armLevelFromSave")
                
                var justDeleted: Bool = false
                //Deletes extra characterStats objects as safety measure
                if (searchResultsCount > 1){
                    DatabaseController.getContext().delete(result)
                    searchResultsCount = searchResultsCount - 1
                    justDeleted = true

                }
                
                if !justDeleted {
                    print("\(result.upperBodyLevelFromSave) \(result.coreLevelFromSave) \(result.armLevelFromSave) \(result.legsLevelFromSave)")
                
                    setData(u: Int(result.upperBodyLevelFromSave), c: Int(result.coreLevelFromSave), a: Int(result.armLevelFromSave), l: Int(result.legsLevelFromSave)
                    )
                }
            }
            
            print("Number of results: \((try DatabaseController.getContext().fetch(fetchRequest)).count)")
            
            
        } catch{
            fatalError("Error retrieving data: \(error)")
        }
        
        DatabaseController.saveContext()
    }
    
    static func coreDataSaving(){
        let fetchRequest:NSFetchRequest<CharacterStats> = CharacterStats.fetchRequest()
        
        do{
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            for result in searchResults as [CharacterStats]{
                result.setValue(ViewController.upperBodyLevel, forKey: "upperBodyLevelFromSave")
                result.setValue(ViewController.coreLevel, forKey: "coreLevelFromSave")
                result.setValue(ViewController.armLevel, forKey: "armLevelFromSave")
                result.setValue(ViewController.legLevel, forKey: "legsLevelFromSave")
                
                print("\(result.upperBodyLevelFromSave) \(result.coreLevelFromSave) \(result.armLevelFromSave) \(result.legsLevelFromSave)")
                
            }
            
        } catch{
            fatalError("Error retrieving data: \(error)")
        }
        
        DatabaseController.saveContext()
    }
    
    // MARK: Set and Retrieve Data for Four Levels
    
    func setData(u: Int, c: Int, a: Int, l: Int){
        ViewController.upperBodyLevel = u
        ViewController.coreLevel = c
        ViewController.armLevel = a
        ViewController.legLevel = l
        
        
        //print("Main Page Retrieve Data Complete")
    }
    
    static func retrieveData() -> [Int]{
        return [ViewController.upperBodyLevel,ViewController.coreLevel,ViewController.armLevel,ViewController.legLevel]
    }
    
    //MARK: Level sliders configuration
    func setupLevelSliders(){
        
        armStepper.center.x = view.frame.width/7
        armStepper.center.y = view.frame.height/1.75
        armStepper.stepValue = 1
        armStepper.minimumValue = 1
        armStepper.maximumValue = 5
        armStepper.value = Double(ViewController.armLevel)
        armStepper.addTarget(self, action: #selector(armStepperMethod), for: .valueChanged)
        
        upperBodyStepper.center.x = view.frame.width/1.15
        upperBodyStepper.center.y = view.frame.height/1.75
        upperBodyStepper.stepValue = 1
        upperBodyStepper.minimumValue = 1
        upperBodyStepper.maximumValue = 5
        upperBodyStepper.value = Double(ViewController.upperBodyLevel)
        upperBodyStepper.addTarget(self, action: #selector(stepperMethod), for: .valueChanged)
        
        coreStepper.center.x = view.frame.width/7
        coreStepper.center.y = view.frame.height/1.25
        coreStepper.stepValue = 1
        coreStepper.minimumValue = 1
        coreStepper.maximumValue = 5
        coreStepper.value = Double(ViewController.coreLevel)
        coreStepper.addTarget(self, action: #selector(stepperMethod), for: .valueChanged)
        
        legsStepper.center.x = view.frame.width/1.15
        legsStepper.center.y = view.frame.height/1.25
        legsStepper.stepValue = 1
        legsStepper.minimumValue = 1
        legsStepper.maximumValue = 5
        legsStepper.value = Double(ViewController.legLevel)
        legsStepper.addTarget(self, action: #selector(stepperMethod), for: .valueChanged)
        
        view.addSubview(armStepper)
        view.addSubview(upperBodyStepper)
        view.addSubview(coreStepper)
        view.addSubview(legsStepper)
    }
    
    func stepperMethod(){
        //print(upperBodyStepper.value)
        
        setData(u: (Int) (upperBodyStepper.value), c: (Int) (coreStepper.value), a: (Int) (armStepper.value), l: (Int) (legsStepper.value))
        ViewController.coreDataSaving()
        updateStrengthBar()
        
        upperBodyImage.image = UIImage(named: "Level " + String(ViewController.upperBodyLevel) + " - Upper Body")
        
        var coreDetermineString = ""
        if(ViewController.coreLevel > 3 && ViewController.armLevel > 3 && ViewController.upperBodyLevel > 2){
            coreDetermineString = "Best "
        }else if(ViewController.coreLevel > 3){
            coreDetermineString = "Worst "
        }else{
            coreDetermineString = ""
        }
        coreImage.image = UIImage(named: "Level " + String(ViewController.coreLevel) + " - " + coreDetermineString + "Core")
        
        legsImage.image = UIImage(named: "Level " + String(ViewController.legLevel) + " - Legs")
        shortsImage.image = UIImage(named: "Level " + String(ViewController.legLevel) + " - Shorts")
        
        print(ViewController.retrieveData())
        
    }
    
    func armStepperMethod(){
        setData(u: (Int) (upperBodyStepper.value), c: (Int) (coreStepper.value), a: (Int) (armStepper.value), l: (Int) (legsStepper.value))
        ViewController.coreDataSaving()
        updateStrengthBar()
        
        updateBodyPart(imageView: leftArmImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.armLevel) + " - Left 1", centerXAdjust: 1.99, centerYAdjust: 2.35)
        
        updateBodyPart(imageView: rightArmImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.armLevel) + " - Right 1", centerXAdjust: 2.01, centerYAdjust: 2.35)
        
        stopAnimateTitleCharacterSequence()
        animateTitleCharacterSequence()
        
        print(ViewController.retrieveData())

    }
    
    //MARK: Call to update strength bar
    
    func updateStrengthBar(){
        let characterBarDoubleHelper = (ViewController.upperBodyLevel + ViewController.coreLevel + ViewController.armLevel + ViewController.legLevel - 4)
        characterBarDouble = CGFloat(characterBarDoubleHelper)/16
        
        characterBar.animateTo(progress: characterBarDouble)
        
        print(characterBarDouble)
//        let characterBarInt = (Int)(characterBarDouble * 10)
//
//        if characterBarInt % 5 == 0{
//            print("Getting here?")
//            confettiButtonMethod()
//        }
    }
    
    //MARK: Create character image in title screen
    
    func setupCharacterImage(){
        initBodyPart(imageView: leftArmImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.armLevel) + " - Left 1", centerXAdjust: 1.99, centerYAdjust: 2.35)
        
        initBodyPart(imageView: rightArmImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.armLevel) + " - Right 1", centerXAdjust: 2.01, centerYAdjust: 2.35)
        
        initBodyPart(imageView: upperBodyImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.upperBodyLevel) + " - Upper Body", centerXAdjust: 2, centerYAdjust: 2.35)
        
        var coreDetermineString = ""
        if(ViewController.coreLevel > 3 && ViewController.armLevel > 3 && ViewController.upperBodyLevel > 2){
            coreDetermineString = "Best "
        }else if(ViewController.coreLevel > 3){
            coreDetermineString = "Worst "
        }else{
            coreDetermineString = ""
        }
        
        initBodyPart(imageView: coreImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.coreLevel) + " - " + coreDetermineString + "Core", centerXAdjust: 2, centerYAdjust: 2.36)
        
        initBodyPart(imageView: legsImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.legLevel) + " - Legs", centerXAdjust: 2, centerYAdjust: 2.365)
        
        initBodyPart(imageView: shortsImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Level " + String(ViewController.legLevel) + " - Shorts", centerXAdjust: 2, centerYAdjust: 2.365)
        
        initBodyPart(imageView: headImage, widthAdjustScreen: 0.92, lengthAdjustScreen: 1.635555, nameImage: "Head Smirking", centerXAdjust: 2, centerYAdjust: 2.34)
    }
    
    //MARK: Call to create body part
    
    func initBodyPart(imageView: UIImageView, widthAdjustScreen: CGFloat, lengthAdjustScreen: CGFloat, nameImage: String, centerXAdjust: CGFloat, centerYAdjust: CGFloat){
        imageView.frame.size.width = view.frame.width/widthAdjustScreen
        imageView.frame.size.height = view.frame.height/lengthAdjustScreen
        imageView.image = UIImage(named: nameImage)
        imageView.center.x = view.frame.width/centerXAdjust
        imageView.center.y = view.frame.height/centerYAdjust
        view.addSubview(imageView)
    }
    
    func updateBodyPart(imageView: UIImageView, widthAdjustScreen: CGFloat, lengthAdjustScreen: CGFloat, nameImage: String, centerXAdjust: CGFloat, centerYAdjust: CGFloat){
        imageView.frame.size.width = view.frame.width/widthAdjustScreen
        imageView.frame.size.height = view.frame.height/lengthAdjustScreen
        imageView.image = UIImage(named: nameImage)
        imageView.center.x = view.frame.width/centerXAdjust
        imageView.center.y = view.frame.height/centerYAdjust
        view.addSubview(imageView)
    }
    
    //MARK: Sets up title screen with UI elements
    
    func setupTitleScreen(){
        view.backgroundColor = .gray
        
        createBackgroundImage()
        createTitleLabel()
        createHomeScreenButtons()
        createSlider()
        updateStrengthBar()
        createBackgroundMusic()
        addConfettiViews()
        
    }
    
    //MARK: Creates MuscleUp! logo
    func createBackgroundImage(){
        let backImage = #imageLiteral(resourceName: "SkyBackVer2")
        let backImageResize = ViewController.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        //backImage.height = view.frame.width
        self.view.backgroundColor = UIColor(patternImage: backImageResize)

        

    }
    
    static func resizeImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: newWidth, height: newHeight), false, 1)
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    
    func createTitleLabel(){

        titleImageView.center.x = view.frame.width/2
        titleImageView.center.y = view.frame.height/13    //7.8
        titleImageView.image = #imageLiteral(resourceName: "MuscleUp!2")

        titleImageView.frame.size.width = view.frame.width/1.25
        titleImageView.frame.size.height = view.frame.height/6           //13.34
        
        print(titleImageView.frame.size.width)
        print(titleImageView.frame.size.height)

        view.addSubview(titleImageView)
    }
    
    //MARK: Creates Play, Shop, Stats, and more title buttons
    
    func createBackgroundMusic(){
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "background-music-aac", ofType: "caf")!)
        
        do{
            try ViewController.backgroundMusicPlayer = AVAudioPlayer(contentsOf: alertSound)
        }catch{
            print("Music Error")
        }
        
        ViewController.backgroundMusicPlayer.numberOfLoops = -1
        ViewController.backgroundMusicPlayer.volume = 0.5
        ViewController.backgroundMusicPlayer.prepareToPlay()
        ViewController.backgroundMusicPlayer.play()
        
    }
    
    func createHomeScreenButtons(){
        
        playButton.center.x = view.frame.width/2
        playButton.center.y = view.frame.height/1.51
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(playButtonMethod), for: .touchUpInside)
        playButton.titleLabel!.font =  UIFont(name: "Verdana", size: 30)
        playButton.frame.size.width = view.frame.width/2.14286
        playButton.frame.size.height = view.frame.height/10.26154

        
        /**let playFirstColor = UIColor(colorLiteralRed: 0, green: 0, blue: 1, alpha: 1)
         let playSecondColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0.6, alpha: 1)
         playButton.colors = .init(button: playFirstColor, shadow: playSecondColor)
         playButton.shadowHeight = 5
         playButton.cornerRadius = 5**/
        playButton.shadowHeight = 4
        view.addSubview(playButton)
        
        shopButton.center.x = view.frame.width/2
        shopButton.center.y = view.frame.height/1.305
        shopButton.setTitle("Shop", for: .normal)
        shopButton.addTarget(self, action: #selector(shopButtonMethod), for: .touchUpInside)
        shopButton.titleLabel!.font =  UIFont(name: "Verdana", size: 25)
        shopButton.shadowHeight = 4
        shopButton.frame.size.width = view.frame.width/2.5
        shopButton.frame.size.height = view.frame.height/13.34
        view.addSubview(shopButton)
        
        
        statsButton.center.x = view.frame.width/2
        statsButton.center.y = view.frame.height/1.17
        statsButton.setTitle("Statistics", for: .normal)
        statsButton.addTarget(self, action: #selector(statsButtonMethod), for: .touchUpInside)
        statsButton.titleLabel!.font =  UIFont(name: "Verdana", size: 23)
        statsButton.shadowHeight = 4
        statsButton.frame.size.width = view.frame.width/2.5
        statsButton.frame.size.height = view.frame.height/13.34
        view.addSubview(statsButton)
        
        creditsButton.center.x = view.frame.width/8
        creditsButton.center.y = view.frame.height/1.05
        creditsButton.setTitle("Credits", for: .normal)
        creditsButton.addTarget(self, action: #selector(creditsButtonMethod), for: .touchUpInside)
        creditsButton.shadowHeight = 4
        creditsButton.frame.size.width = view.frame.width/4.41176
        creditsButton.frame.size.height = view.frame.height/16.675
        view.addSubview(creditsButton)
        
        let confettiButton = PressableButton(frame: CGRect(x: 0, y: 0, width: 75, height: 30))
        confettiButton.center.x = view.frame.width/2
        confettiButton.center.y = view.frame.height/1.05
        confettiButton.setTitle("Confetti", for: .normal)
        confettiButton.addTarget(self, action: #selector(confettiButtonMethod), for: .touchUpInside)
        view.addSubview(confettiButton)

        musicToggle.center.x = view.frame.width/1.2
        musicToggle.center.y = view.frame.height/1.05
        musicToggle.addTarget(self, action: #selector(musicToggleMethod), for: .valueChanged)
        musicToggle.frame.size.width = view.frame.width/7.5
        musicToggle.frame.size.height = view.frame.height/22.23333
        view.addSubview(musicToggle)
        
        volumeImagePic.image = #imageLiteral(resourceName: "volumeImage")
        volumeImagePic.center.x = view.frame.width/1.06
        volumeImagePic.center.y = view.frame.height/1.05
        volumeImagePic.frame.size.width = view.frame.width/9.375
        volumeImagePic.frame.size.height = view.frame.height/16.675
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
    
    //MARK: Create strength slider and strength label
    
    func createSlider(){
        
        characterBar.center.x = view.frame.width/2
        characterBar.center.y = view.frame.height/4.5
        //characterBar.barBorderColor = .blue
        characterBar.barBorderColor = UIColor(patternImage: #imageLiteral(resourceName: "BlueStripesBarBorder"))
        //characterBar.barBackgroundColor = .gray
        characterBar.barBackgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "SkyBack"))
        //characterBar.barFillColor = .blue
        characterBar.barFillColor = UIColor(patternImage: #imageLiteral(resourceName: "BlueStripesBar"))
        characterBar.barFillInset = 0.4
        characterBar.displayLabel = false
        characterBar.frame.size.width = view.frame.width/1.875
        characterBar.frame.size.height = view.frame.height/51.30769
        //characterBar.cornerRadius = 5
        view.addSubview(characterBar)
        
        characterBarLabel.center.x = view.frame.width/2
        characterBarLabel.center.y = view.frame.height/5.05
        characterBarLabel.textAlignment = .center
        characterBarLabel.text = "Strength:"
        characterBarLabel.font = UIFont(name: "Verdana-Bold", size: 14)
        characterBarLabel.frame.size.width = view.frame.width/3.75
        characterBarLabel.frame.size.height = view.frame.height/22.23333
        //characterBarLabel.font = characterBarLabel.font.withSize(14)
        view.addSubview(characterBarLabel)
    }
    
    func playButtonMethod(){

        firstTimeOpeningApp = false
        
        playButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.playButton.transform = CGAffineTransform.identity
        }, completion: nil)
        
        
        let delayInSeconds = 0.8
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            ViewController.backgroundMusicPlayer.stop()
            let playViewController = PlayViewController()
            playViewController.modalTransitionStyle = .crossDissolve
            self.present(playViewController, animated: true, completion: nil)
        }

        
        
    }
    
    func shopButtonMethod(){
        //print("Shop pressed")
        firstTimeOpeningApp = false
        ViewController.backgroundMusicPlayer.stop()

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
        shopViewController.modalTransitionStyle = .crossDissolve
        self.present(shopViewController, animated: true, completion: nil)

    }
    
    func statsButtonMethod(){
        //print("Statistics pressed")
        ViewController.backgroundMusicPlayer.stop()
        firstTimeOpeningApp = false
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.modalTransitionStyle = .crossDissolve
        self.present(statisticsViewController, animated: true, completion: nil)
    }

    
    func creditsButtonMethod(){
        //print("Credits Pressed")
        firstTimeOpeningApp = false
        ViewController.backgroundMusicPlayer.stop()
        let creditsViewController = CreditsViewController()
        creditsViewController.modalTransitionStyle = .crossDissolve
        self.present(creditsViewController, animated: true, completion: nil)
    }
    
    func confettiButtonMethod(){
        //print("Confetti pressed")
        
        JSSAlertView().show(
            self,
            title: "Congratulations! You Muscled Up!",
            text: "You reached Level 3 in Upper Body Workout. Gnarly!",
            buttonText: "Right on!",
            color: .cyan,
            iconImage: #imageLiteral(resourceName: "CongratsStar")
            //delay: 10000
        )
        
        /**if confettiIsActive {
            stopConfetti()
            confettiIsActive = false
            
        }**/
        //else{
        startConfetti()
            //confettiIsActive = true
            
        //}
        let delayInSeconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.stopConfetti()
            //self.confettiIsActive = false
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
        if playingMusic {
            print("The button turned off music.")
            playingMusic = false
            //backgroundMusicPlayer.pause()
            ViewController.backgroundMusicPlayer.volume = 0
        } else {
            print("the button turned on music.")
            playingMusic = true
            //backgroundMusicPlayer.play()
            ViewController.backgroundMusicPlayer.volume = 0.5
        }
        
        
        
        
    }
    
    //MARK: Animate title character
    func stopAnimateTitleCharacterSequence(){
        leftArmImage.layer.removeAllAnimations()
        rightArmImage.layer.removeAllAnimations()
    }
    
    
    func animateTitleCharacterSequence(){
        
        
        /**let delayInSeconds = 0.965
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
         self.leftArmImage.image = self.leftArmImage.animationImages?.last
         self.rightArmImage.image = self.rightArmImage.animationImages?.last
         //self.view.addSubview(self.leftArmImage)
         //self.view.addSubview(self.rightArmImage)
         }**/
        
        let x = 100
        
        leftArmImage.animationImages = [UIImage]()
        
        for _ in 1...10
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 1")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left " + String(i))
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 9")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left " + String(10-i))
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 1")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x+9)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 1")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left " + String(i))
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 9")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x+9)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 9")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left " + String(10-i))
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Left 1")
            if let anImage = image{
                leftArmImage.animationImages?.append(anImage)
            }
        }
        
        rightArmImage.animationImages = [UIImage]()
        
        for _ in 1...10
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 1")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right " + String(i))
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 9")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right " + String(10-i))
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 1")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right " + String(i))
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 9")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right " + String(10-i))
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 1")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right " + String(i))
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 9")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        for i in 1...9
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right " + String(10-i))
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        for _ in 1...(x)
        {
            let image = UIImage(named: "Level "+String(ViewController.armLevel)+" - Right 1")
            if let anImage = image{
                rightArmImage.animationImages?.append(anImage)
            }
        }
        
        
        
        leftArmImage.animationDuration = 16
        //leftArmImage.animationRepeatCount = 3
        leftArmImage.startAnimating()
        
        view.addSubview(leftArmImage)
        
        
        rightArmImage.animationDuration = 16
        //rightArmImage.animationRepeatCount = 3
        rightArmImage.startAnimating()
        
        view.addSubview(rightArmImage)
        
        
    }

    
    override func didReceiveMemoryWarning() {
        print("ITAI GET OFF MY PORCH")
    }
    


}

