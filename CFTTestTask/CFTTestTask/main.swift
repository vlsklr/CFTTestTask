//
//  main.swift
//  CFTTestTask
//
//  Created by Vlad on 16.09.2020.
//  Copyright © 2020 Vlad. All rights reserved.
//

import Foundation
var menuPosition: String? = "0"
var carList = [Car]()
let car = Car()
print(car.manufacturerName)
print(car.bodyType)
print(car.modelName)
carList.append(car)

func validateYearOfManufactoring(yearOfManu: Int) -> Bool {
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: Date())
    if (yearOfManu >= 1870 && yearOfManu <= currentYear){
        return true
    }
    else
    {
        return false
    }
}

func printCarList(){
    guard carList.count > 0 else {
        print("Car list is empty \(carList.count)")
        return
    }
    var id = 1
    for carItem in carList {
        print("id : \(id) manufacturerName: \(String(describing: carItem.manufacturerName)) modelName: \(String(describing: carItem.modelName)) yearOfManufactoring: \(String(describing: carItem.yearOfManufactoring)) bodyType: \(String(describing: carItem.bodyType))")
        id += 1
    }
}

func addNewCar() {
    print("Insert a manufactorer name: ")
    let manufactorerName = readLine()
    print("Insert a model name")
    let modelName = readLine()
    print("Insert a body type")
    let bodyType = readLine()
    print("Insert a year of manufactoring: ")
    var validateStatus = false
    var manufactoringYear = 0
    repeat{
        manufactoringYear = Int(readLine()!) ?? 0
        validateStatus = validateYearOfManufactoring(yearOfManu: manufactoringYear)
        if validateStatus == false {
            print("Year is invalid! Try to insert a year of manufactoring again")
        }
    }while(!validateStatus)
    
    let newCar = Car(manufacturerName: manufactorerName ?? "Unknown", yearOfManufactoring: manufactoringYear, modelName: modelName ?? "Unknown", bodyType: bodyType ?? "Unknown")
    carList.append(newCar)
}

func deleteCar(id : Int) {
    guard id > 0 && id <= carList.count else {
        print("ID is invalid")
        return
    }
    carList.remove(at: id-1)
}

func updateCar() {
    //carList[0].bodyType = 0
    print("Insert a car ID:")
    
}
repeat {
  print("Select menu item:")
    print(" 1.Show cars list.\n",
  "2.Add new car.\n",
  "3.Delete car from list.\n",
  "4.Change info about car from list\n",
  "0.Exit")
  menuPosition = readLine()
  switch menuPosition {
  case "1":
    printCarList()
  case "2":
    addNewCar()
  case "3":
    print("Insert ID:")
    deleteCar(id: Int(readLine()!) ?? 0)
  default:
    print("default")

  }
} while (menuPosition != "0")


