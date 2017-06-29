//
//  ShopViewController.swift
//  MuscleUp!
//
//  Created by Ohad Koronyo on 5/27/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import CoreData
import UIKit
import SwiftyButton

class ShopViewController: UIViewController {

    
    var coinAmount: Int = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupShopScreen()
    }
    
    func setupShopScreen(){
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
        
        createCoinDisplay()
    }
    
    func createBackgroundImage(){
        let backImage = #imageLiteral(resourceName: "SkyBackNoCloud")
        let backImageResize = ViewController.resizeImage(image: backImage, newWidth: view.frame.width, newHeight: view.frame.height)
        //backImage.height = view.frame.width
        self.view.backgroundColor = UIColor(patternImage: backImageResize)
        
        
        
    }
    
    func createCoinDisplay(){
        
        let coinImagePic = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        coinImagePic.image = #imageLiteral(resourceName: "empty-gold-coin")
        coinImagePic.center.x = view.frame.width/1.2
        coinImagePic.center.y = view.frame.height/10
        view.addSubview(coinImagePic)
        
        let coinLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 25))
        coinLabel.center.x = view.frame.width/1.09
        coinLabel.center.y = view.frame.height/10
        coinLabel.textAlignment = .center
        coinLabel.text = String(coinAmount)
        coinLabel.font = UIFont(name: "Verdana-Bold", size: 20)
        //coinLabel.font = coinLabel.font.withSize(20)
        view.addSubview(coinLabel)
    }
    
    func backButtonMethod(){
        print("Back pressed")
        ViewController.backgroundMusicPlayer.play()
        self.dismiss(animated: true, completion: nil)
    }

}
