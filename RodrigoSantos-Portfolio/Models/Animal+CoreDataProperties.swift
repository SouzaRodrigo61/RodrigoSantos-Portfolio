//
//  Animal+CoreDataProperties.swift
//  RodrigoSantos-Portfolio
//
//  Created by Rodrigo Santos on 28/05/20.
//  Copyright © 2020 Rodrigo Santos. All rights reserved.
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String

}
