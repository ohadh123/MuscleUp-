//
//  StatisticsViewController.swift
//  MuscleUp!
//
//  Created by Etai Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import SwiftyButton
import ConcentricProgressRingView

class StatisticsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStatisticsScreen()
    }
    
    func setupStatisticsScreen(){
        view.backgroundColor = .gray
        createBackButton()
        createConcentricCircles()
        
        
       
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
    
    func createConcentricCircles(){
        
 
        let upperBodyProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/5, y: view.frame.height/3), marginP: 2, radiusP: 60, width1: 14, width2: 18)
        view.addSubview(upperBodyProgress)
        
        updateConcentricCircle(ring: upperBodyProgress, firstArc: 0.2, secondArc: 0.5)
        
        let coreProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/1.5, y: view.frame.height/3), marginP: 2, radiusP: 60, width1: 14, width2: 18)
        view.addSubview(coreProgress)
        
        updateConcentricCircle(ring: coreProgress, firstArc: 0.4, secondArc: 0.7)
        
        let armProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/5, y: view.frame.height/1.75), marginP: 2, radiusP: 60, width1: 14, width2: 18)
        view.addSubview(armProgress)
        
        updateConcentricCircle(ring: armProgress, firstArc: 0, secondArc: 0.8)
        
        let legProgress = createConcentricCircle(foregroundC1: .yellow, foregroundC2: .green, backgroundC: .darkGray, centerP: CGPoint(x: view.frame.width/1.5, y: view.frame.height/1.75), marginP: 2, radiusP: 60, width1: 14, width2: 18)
        view.addSubview(legProgress)
        
        updateConcentricCircle(ring: legProgress, firstArc: 0.5, secondArc: 0.2)
        
        
        
        
    
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
        ring.arcs[0].setProgress(firstArc, duration: 3)
        ring.arcs[1].setProgress(secondArc, duration: 3)
    }

}
