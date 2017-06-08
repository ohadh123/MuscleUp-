//
//  CharacterStats+CoreDataProperties.swift
//  MuscleUp!
//
//  Created by Etai Koronyo on 6/8/17.
//  Copyright © 2017 Ohad Koronyo. All rights reserved.
//

import Foundation
import CoreData


extension CharacterStats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterStats> {
        return NSFetchRequest<CharacterStats>(entityName: "CharacterStats")
    }

    @NSManaged public var upperBodyLevelFromSave: Int16
    @NSManaged public var coreLevelFromSave: Int16
    @NSManaged public var armLevelFromSave: Int16
    @NSManaged public var legsLevelFromSave: Int16

}
