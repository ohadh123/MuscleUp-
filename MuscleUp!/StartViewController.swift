//
//  StartViewController.swift
//  MuscleUp!
//
//  Created by Etai Koronyo on 5/28/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        
        let loadingIcon = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        //let viewload = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadingIcon.center.x = view.frame.width/2
        loadingIcon.center.y = view.frame.height/2
        loadingIcon.type = .ballClipRotateMultiple
        loadingIcon.startAnimating()
        
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            loadingIcon.stopAnimating()
            let viewController = ViewController()
            viewController.modalTransitionStyle = .crossDissolve
            self.present(viewController, animated: true, completion: nil)
        }
        view.addSubview(loadingIcon)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
