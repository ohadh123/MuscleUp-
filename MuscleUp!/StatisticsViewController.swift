//
//  StatisticsViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import SwiftyButton
import ConcentricProgressRingView

class StatisticsViewController: UIViewController {

    var statsTitleLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 100))
    
    var upperBodyProgress: ConcentricProgressRingView? = nil
    var upperBodyLevelLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var upperBodyLevel: Int = 0
    var upperBodySetsRemaining: Int = 12
    var upperBodySetsOutOf: Int = 15
    var upperBodyPullUp: Int = 20
    
    var coreProgress: ConcentricProgressRingView? = nil
    var coreLevelLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var coreLevel: Int = 0
    var coreSetsRemaining: Int = 10
    var coreSetsOutOf: Int = 10
    var coreSitUp: Int = 15
    
    var armProgress: ConcentricProgressRingView? = nil
    var armLevelLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var armLevel: Int = 0
    var armSetsRemaining: Int = 0
    var armSetsOutOf: Int = 30
    var armCurls: Int = 30
    
    var legProgress: ConcentricProgressRingView? = nil
    var legLevelLabel:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    var legLevel: Int = 0
    var legSetsRemaining: Int = 8
    var legSetsOutOf: Int = 15
    var legSquats: Int = 25

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initializeData(){
        upperBodyLevel = ViewController.upperBodyLevel
        coreLevel = ViewController.coreLevel
        armLevel = ViewController.armLevel
        legLevel = ViewController.legLevel
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initializeData()
        setupStatisticsScreen()
        
    }
    
    func setupStatisticsScreen(){
        view.backgroundColor = .gray
        
        createLabel(label: statsTitleLabel, centerX: view.frame.width/2, centerY: view.frame.height/6, textP: "Statistics", sizeP: 40)
        createBackButton()
        createCircleLevelLabels()
        createCircleTitles()
        createCircleInfoLabels()
        createConcentricCircles()
        
    }
    
    func createConcentricCircles(){
        
        upperBodyProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/5, y: view.frame.height/3), marginP: 2, radiusP: 45, width1: 12, width2: 12)
        if let unwrappedUpperBodyProgress = upperBodyProgress{
            view.addSubview(unwrappedUpperBodyProgress)
            updateConcentricCircle(ring: unwrappedUpperBodyProgress, firstArc: CGFloat(upperBodySetsRemaining)/CGFloat(upperBodySetsOutOf), secondArc: CGFloat(upperBodyLevel) * CGFloat(0.2))
        }
        
        coreProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/1.5, y: view.frame.height/3), marginP: 2, radiusP: 45, width1: 12, width2: 12)
        if let unwrappedCoreProgress = coreProgress{
            view.addSubview(unwrappedCoreProgress)
            updateConcentricCircle(ring: unwrappedCoreProgress, firstArc: CGFloat(coreSetsRemaining)/CGFloat(coreSetsOutOf), secondArc: CGFloat(coreLevel) * CGFloat(0.2))

        }
        
        armProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/5, y: view.frame.height/1.75), marginP: 2, radiusP: 45, width1: 12, width2: 12)
        if let unwrappedArmProgress = armProgress {
            view.addSubview(unwrappedArmProgress)
            updateConcentricCircle(ring: unwrappedArmProgress, firstArc: CGFloat(armSetsRemaining)/CGFloat(armSetsOutOf), secondArc: CGFloat(armLevel) * CGFloat(0.2))
        }
        
        legProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/1.5, y: view.frame.height/1.75), marginP: 2, radiusP: 45, width1: 12, width2: 12)
        if let unwrappedLegProgress = legProgress{
            view.addSubview(unwrappedLegProgress)
            updateConcentricCircle(ring: unwrappedLegProgress, firstArc: CGFloat(legSetsRemaining)/CGFloat(legSetsOutOf), secondArc: CGFloat(legLevel) * CGFloat(0.2))
        }
        
    }
    
    func createCircleTitles(){
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/5, centerY: view.frame.height/4.2, textP: "Upper Body", sizeP: 18)
        createLabel(label: UILabel(frame: CGRect(x:0, y:0,width:200, height:100)), centerX: view.frame.width/1.5, centerY: view.frame.height/4.2, textP: "Core", sizeP: 18)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/5, centerY: view.frame.height/2.1, textP: "Arm", sizeP: 18)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.5, centerY: view.frame.height/2.1, textP: "Lower Body", sizeP: 18)
    }
    
    func createCircleInfoLabels(){
        
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/2.675, centerY: view.frame.height/3.25, textP: "Level: " + String(upperBodyLevel), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/2.48, centerY: view.frame.height/3, textP: "Sets: " + String(upperBodySetsRemaining) + "/"+String(upperBodySetsOutOf), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/2.53, centerY: view.frame.height/2.8, textP: "PullUps: " + String(upperBodyPullUp), sizeP: 10)
        
        
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.19, centerY: view.frame.height/3.25, textP: "Level: " + String(coreLevel), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.145, centerY: view.frame.height/3, textP: "Sets: " + String(coreSetsRemaining) + "/"+String(coreSetsOutOf), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.17, centerY: view.frame.height/2.8, textP: "SitUps: " + String(coreSitUp), sizeP: 10)
        
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/2.675, centerY: view.frame.height/1.83, textP: "Level: " + String(armLevel), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/2.48, centerY: view.frame.height/1.75, textP: "Sets: " + String(armSetsRemaining) + "/"+String(armSetsOutOf), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/2.65, centerY: view.frame.height/1.68, textP: "Curls: " + String(armCurls), sizeP: 10)
        
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.19, centerY: view.frame.height/1.83, textP: "Level: " + String(legLevel), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.145, centerY: view.frame.height/1.75, textP: "Sets: " + String(legSetsRemaining) + "/"+String(legSetsOutOf), sizeP: 10)
        createLabel(label: UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100)), centerX: view.frame.width/1.17, centerY: view.frame.height/1.68, textP: "Squats: " + String(legSquats), sizeP: 10)
    }
    
    func createCircleLevelLabels(){
        createLabel(label: upperBodyLevelLabel, centerX: view.frame.width/5, centerY: view.frame.height/3, textP: String(upperBodyLevel), sizeP: 18)
        createLabel(label: coreLevelLabel, centerX: view.frame.width/1.5, centerY: view.frame.height/3, textP: String(coreLevel), sizeP: 18)
        createLabel(label: armLevelLabel, centerX: view.frame.width/5, centerY: view.frame.height/1.75, textP: String(armLevel), sizeP: 18)
        createLabel(label: legLevelLabel, centerX: view.frame.width/1.5, centerY: view.frame.height/1.75, textP: String(legLevel), sizeP: 18)
        
    }
    
    func createLabel(label: UILabel, centerX: CGFloat, centerY: CGFloat, textP: String, sizeP: CGFloat){
        label.center.x = centerX
        label.center.y = centerY
        label.textAlignment = .center
        label.text = textP
        label.font = UIFont(name: "Verdana-Bold", size: sizeP)
        
        view.addSubview(label)
    }
    
    func createConcentricCircle(foregroundC1:UIColor, foregroundC2:UIColor, backgroundC:UIColor, centerP:CGPoint, marginP:CGFloat, radiusP:CGFloat, width1:CGFloat,width2:CGFloat) -> ConcentricProgressRingView{
        
        let center = centerP
        let margin = marginP
        let radius = radiusP
        let ring1 = ProgressRing(color: foregroundC1, backgroundColor: backgroundC, width: width1)
        let ring2 = ProgressRing(color: foregroundC2, backgroundColor: backgroundC, width: width2)
        
        let rings = [ring1, ring2]

        return ConcentricProgressRingView(center: center, radius: radius, margin: margin, rings: rings)

    }
    
    func updateConcentricCircle(ring: ConcentricProgressRingView, firstArc: CGFloat, secondArc: CGFloat){
        ring.arcs[0].setProgress(firstArc, duration: 2)
        ring.arcs[1].setProgress(secondArc, duration: 2)
        
        let delayInSeconds = 1.6
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
        if firstArc == 1 && secondArc == 1{
            let completedImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
            completedImage.image = UIImage(named: "CompletedStamp")
            completedImage.center.x = ring.center.x
            completedImage.center.y = ring.center.y
            
            self.view.addSubview(completedImage)
            
        }
        }
    }
    
    func createBackButton(){
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
    func backButtonMethod(){
        print("Back pressed")
        self.dismiss(animated: true, completion: nil)
    }

}
