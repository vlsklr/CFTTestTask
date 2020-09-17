//
//  Car.swift
//  CFTTestTask
//
//  Created by Vlad on 16.09.2020.
//  Copyright © 2020 Vlad. All rights reserved.
//

import Foundation

 class Car {
    var manufacturerName: String?
    var yearOfManufactoring: Int?
    var modelName: String?
    var bodyType: String?

    init() {
        manufacturerName = "Mitsubishi"
        yearOfManufactoring = 2008
        modelName = "Galant"
        bodyType = "Sedan"
    }
    init(manufacturerName: String) {
        self.manufacturerName = manufacturerName
        yearOfManufactoring = 2000
        modelName = "Unknown"
        bodyType = "Unknown"
    }
    init(manufacturerName: String, yearOfManufactoring: Int) {
        self.manufacturerName = manufacturerName
        self.yearOfManufactoring = yearOfManufactoring
        modelName = "Unknown"
        bodyType = "Unknown"
    }
    init(manufacturerName: String, yearOfManufactoring: Int, modelName: String ){
      self.manufacturerName = manufacturerName
      self.yearOfManufactoring = yearOfManufactoring
      self.modelName = modelName
      bodyType = "Unknown"
    }
    init(manufacturerName: String, yearOfManufactoring: Int, modelName: String, bodyType: String ){
      self.manufacturerName = manufacturerName
      self.yearOfManufactoring = yearOfManufactoring
      self.modelName = modelName
      self.bodyType = bodyType
    }

}
