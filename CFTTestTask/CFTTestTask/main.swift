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


func loadDataFromFile() {
    let manager = FileManager.default
    do {
        //Получаем список файлов в рабочей папке
        let filesInDirectory = try manager.contentsOfDirectory(atPath: manager.currentDirectoryPath)
        //Проверяем наличие искомого
        if (filesInDirectory.contains("carBase.txt")){
            //Получаем и разделяем на массив строк
           let contntsOfFile = try NSString(contentsOfFile: manager.currentDirectoryPath + "/carBase.txt", encoding: String.Encoding.utf8.rawValue)
            let tempArrayOfCars = contntsOfFile.components(separatedBy: "\n")
            for item in tempArrayOfCars {
                //Разбиваем каждую строку массива на значения, создаем экземпляр машины и добавляем в массив
                    let currentCar = item.components(separatedBy: ",")
                    if (currentCar.count == 4) {
                        carList.append(Car(manufacturerName: currentCar[0], yearOfManufactoring: Int(currentCar[2]) ?? 1900, modelName: currentCar[1], bodyType: currentCar[3]))
                    
                }
            }
        }
    }
    catch {
        print("Something wrong: \(error)")
    
    }
}

func saveDataToFile() {
    //формируем адрес сохранения данных
    let fileUrl = FileManager.default.currentDirectoryPath + "/carBase.txt"
    var resultString: String = ""
    //приводим каждую строку массива машин к нужному виду
    for item in carList {
        var tmpString = item.manufacturerName + ","
        tmpString += item.modelName + ","
        tmpString += String(item.yearOfManufactoring) + ","
        tmpString += item.bodyType + "\n"
        resultString += tmpString
        
    }
    //пытаемся записать в файл. Файл каждый раз перезаписывается
    do {
        try resultString.write(toFile: fileUrl, atomically: false, encoding: .utf8)
    }
    catch {
        print("Something wrong during writingFile \(error)")
    }
}
// функция проверяет метод на валидность - машина может быть выпущена с 1806 года и до текущего
func validateYearOfManufactoring(yearOfManu: Int) -> Bool {
    let calendar = Calendar.current
    let currentYear = calendar.component(.year, from: Date())
    if (yearOfManu >= 1806 && yearOfManu <= currentYear){
        return true
    }
    else
    {
        return false
    }
}
//Функция выводит список машин в консоль
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
// Функция добавляет новый автомобиль, если при вводе какого либо года что-то пошло не так значение по умолчанию "Unknown"
func addNewCar() {
    print("Insert a manufactorer name: ")
    let manufactorerName = readLine() ?? "Unknown"
    print("Insert a model name")
    let modelName = readLine() ?? "Unknown"
    print("Insert a body type")
    let bodyType = readLine() ?? "Unknown"
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
    
    let newCar = Car(manufacturerName: manufactorerName, yearOfManufactoring: manufactoringYear, modelName: modelName , bodyType: bodyType )
    carList.append(newCar)
}
//Функция удаления автомобиля. Проверяет наличие в массиве и удаляет
func deleteCar(id : Int) {
    guard id > 0 && id <= carList.count else {
        print("ID is invalid")
        return
    }
    carList.remove(at: id-1)
}
//Обновляет поля на выбор
func updateCar() {
    //выбор изменяего авто
    print("Insert a car ID:")
    var validatedID = false
    var carID = 0
    repeat {
        carID = Int(readLine()!) ?? 0
        if carID > 0 && carID <= carList.count {
            validatedID = true
        }
        else {
            print("ID is invalid! Try again: ")
        }
    }
    while (!validatedID)
    var menuPosition = "0"
    //выбор и изменение поля
    repeat {
        print("Select position to change:\n","1. Body type\n","2. Manufacturer name\n","3. Model name\n", "4. Year of manufactoring\n","0 or any other key to exit")
        menuPosition = readLine() ?? "0"
        switch menuPosition {
        case "1":
            print("Insert new bodytype")
            carList[carID-1].bodyType = readLine() ?? "Unknown"
        case "2":
            print("Insert new manufacturer name")
            carList[carID-1].manufacturerName = readLine() ?? "Unknown"
        case "3":
            print("Insert new model name")
            carList[carID-1].modelName = readLine() ?? "Unknown"
        case "4":
            var validatedYear = false
            print("Insert new year of manufactoring:")
            repeat {
                let yearOfManu = Int(readLine()!) ?? 0
                validatedYear = validateYearOfManufactoring(yearOfManu: yearOfManu)
                if (!validatedYear) {
                    print("Year is invalid. Try again:")
                }else {
                    carList[carID - 1].yearOfManufactoring = yearOfManu
                }
            } while (!validatedYear)
        default:
            menuPosition = "0"
        }
    }while(menuPosition != "0")
}

loadDataFromFile()
repeat {
  print("Select menu item:")
    print(" 1.Show cars list.\n",
  "2.Add new car.\n",
  "3.Delete car from list.\n",
  "4.Change info about car from list\n",
  "0 or any other key to exit")
  menuPosition = readLine()
  switch menuPosition {
  case "1":
    printCarList()
  case "2":
    addNewCar()
    saveDataToFile()
  case "3":
    print("Insert ID:")
    deleteCar(id: Int(readLine()!) ?? 0)
    saveDataToFile()
  case "4":
    updateCar()
    saveDataToFile()
  default:
    print("Good Bye!")
    menuPosition = "0"

  }
} while (menuPosition != "0")


