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

repeat {
  print("Select menu item:")
  print("1.Show cars list. \n
  2.Show info about car from list.\n
  3.Add new car.\n
  4.Delete car from list.\n
  5. Change info about car from list\n
  0. Exit")
  menuPosition = readLine()
  switch menuPosition {
  case "1":
    print("1")
    print("2")
  default:
    print("default")

  }
} while (menuPosition != "0")

let car = Car()
print(car.manufacturerName)
print(car.bodyType)
print(car.modelName)
