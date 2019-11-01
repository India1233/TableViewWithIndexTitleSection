//
//  ViewController.swift
//  TableViewWithIndexTitleSection
//
//  Created by Suresh Shiga on 23/10/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var carsDictionary = [String: [String]]()
    var checkBoxDict = [String: [String]]()
    
    var carSectionTitles = [String]()
    var cars = [String]()
    
    var animalIndexTitles = [String]()
    

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addDataToArray()
        generateDict()
        
        self.tableView.separatorColor = .clear
        self.tableView.sectionIndexColor = .darkGray
        
       
    }
    
    func addDataToArray()  {
        cars = ["Audi", "Aston Martin","BMW", "Bugatti", "Bentley","Chevrolet", "Cadillac","Dodge","England","Egyft","Ferrari", "Ford","Gunde","Gujarat","India","Irland","Honda","Jaguar","Lamborghini","Mercedes", "Mazda","Nissan","Porsche","Rolls Royce","Toyota","Volkswagen","Volkswagen","Volkswagen","Volkswagen","Volkswagen","Volkswagen","Volkswagen","Volkswagen","Volkswagen","unperforated","electryon","freezer","kyle","satiety","phallic","loren","casaba","emulator","introduced","pomeroy","snowdonia","lithog","deconsecrating","rafferty","erich","soke","lodi","poop","marysville","runtier","outsallying","loller","octopi","unthwartable","unheeled","discriminately","assassination","Unfauceted","outcry","porbandar","heritable","immediately","intercarpal","yet","airhead","anthropometrist","granddad","shrank","unriveting","serow","unforged","yogic","slouchily","wolfsburg","baulky","nongraduate","phaye","irradiator","anticlassical","siree","twine","department","unlabouring","supernormality","demander","karyolysis","Tablespoonful","prefermentation","nonregulation","attainder","recane","sclerodermatous","nonevaluation","pedi","browbeaten","prism","naboth","naturelike","tardiest","castlelike","interaccused","finisher","servetus","suppress","hepatize","quadrilateral","sunderland","craftier","lock","galah","preexperienced","selfpropelling","lucrativeness","vigilantness","Busing","preentrance","overregulation","quodlibetic","inflation","inventive","windfall","feverroot","xyloid","critter","earthpea","embracement","amazed","nonagrarian","buttonholed","dipetalous"]
        
        animalIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T","U", "V", "W", "X", "Y", "Z"]
    }
    
    
    func generateDict()  {
        // 1
        for car in cars {
            let carKey = String(car.prefix(1))
            if var carValues = carsDictionary[carKey] {
                carValues.append(car)
                carsDictionary[carKey] = carValues
            } else {
                carsDictionary[carKey] = [car]
            }
        }
        
        // 2
        carSectionTitles = [String](carsDictionary.keys)
        carSectionTitles = carSectionTitles.sorted(by: { $0 < $1 })
        
        checkBoxDict = carsDictionary
        
    }
    
    

     func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        return carSectionTitles.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        let carKey = carSectionTitles[section]
        if let carValues = carsDictionary[carKey] {
            return carValues.count
        }
        return 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UINib(nibName: "FriendsListCell", bundle: nil), forCellReuseIdentifier: "FriendsListCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListCell", for: indexPath) as! FriendsListCell
        
        // Configure the cell...
        let carKey = carSectionTitles[indexPath.section]
        if let carValues = carsDictionary[carKey] {
            cell.titleLabel.text = carValues[indexPath.row]
        }
        
        let checkBoxKey = carSectionTitles[indexPath.section]
        if let checkBoxValues = checkBoxDict[checkBoxKey] {
           let checkMark = checkBoxValues [indexPath.row]
            cell.checkBoxImage.image = (checkMark == "Yes" ) ? UIImage(named: "CheckIcon")  :  UIImage(named: "UncheckIcon")
        }
        
        
        cell.checkBoxButton.tag = indexPath.section
        cell.checkBoxButton.tag = indexPath.row
        
        cell.checkBoxButton.addTarget(self, action: #selector(touchupInsideButton(sender:)), for: .touchUpInside)
        
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return animalIndexTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = carSectionTitles.index(of: title) else { return -1 }
        return index
    }
    
    
    // Adding Removing CheckBox
    
   @objc func touchupInsideButton(sender:UIButton) {
    let buttonPossition = sender.convert(CGPoint.zero, to: tableView)
    if let indexPath = tableView.indexPathForRow(at: buttonPossition) {
        let checkBoxKey = carSectionTitles[indexPath.section]
        if var checkBoxValues = checkBoxDict[checkBoxKey] {
            if checkBoxValues [indexPath.row] == "Yes" {
               checkBoxValues [indexPath.row] = "No"
            } else {
                checkBoxValues [indexPath.row] = "Yes"
            }
            checkBoxDict[checkBoxKey] = checkBoxValues
        }
        self.tableView.reloadSections([indexPath.section], with: .automatic)
    }
    }

}

