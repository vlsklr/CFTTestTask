//
//  Car.swift
//  CFTTestTask
//
//  Created by Vlad on 16.09.2020.
//  Copyright © 2020 Vlad. All rights reserved.
//

import Foundation

 class Car {
   var manufacturerName: String
   var yearOfManufactoring: Int
   var modelName: String
   var bodyType: String

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




/* код демонстрирует обработку исключение
import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

class Temp {
  func vend(name: String) throws {
     throw VendingMachineError.invalidSelection
  }
}
//main

var temp: Temp
//temp.vend(name: "123")
do {
  try temp = Temp()
    //try temp.vend(name: "123")
} catch VendingMachineError.invalidSelection {
    print("Ошибка выбора.")
}
*/
