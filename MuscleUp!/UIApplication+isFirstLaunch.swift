//
//  File.swift
//  MuscleUp!
//
//  Created by Etai Koronyo on 6/8/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import Foundation
import UIKit

private var firstLaunch : Bool = false

extension UIApplication {
    
    static func isFirstLaunch() -> Bool {
        let firstLaunchFlag = "isFirstLaunchFlag"
        let isFirstLaunch = UserDefaults.standard.string(forKey: firstLaunchFlag) == nil
        if (isFirstLaunch) {
            firstLaunch = isFirstLaunch
            UserDefaults.standard.set("false", forKey: firstLaunchFlag)
            UserDefaults.standard.synchronize()
        }
        return firstLaunch || isFirstLaunch
    }
}
