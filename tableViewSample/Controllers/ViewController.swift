//
//  ViewController.swift
//  tableViewSample
//
//  Created by Vsevolod Ban on 8/6/18.
//  Copyright © 2018 Vsevolod Ban. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var animalTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        animalTableView.delegate = self
//        animalTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  tableView.numberOfRows(inSection: 8)
      //  print(arrayOfAnimals.count)
        return animalData.count * 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        if (indexPath.row % 2 == 0) {
            if let animalCell = animalTableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
                animalCell.animalImage.image = UIImage(named: animalData[indexPath.row/2]["Name"]!)
                animalCell.animalName.text = animalData[indexPath.row/2]["Name"]
                return animalCell
            }
        }
        else {
            if let animalInfoCell = animalTableView.dequeueReusableCell(withIdentifier: "animalInfoCell", for: indexPath) as? AnimalInfoTableViewCell {
            
                animalInfoCell.animalSpeed.text = "Speed: \(animalData[indexPath.row/2]["Speed"]!)"

                animalInfoCell.animalSound.text = "Sound: \(animalData[indexPath.row/2]["Sound"]!)"
                return animalInfoCell
            }
        }
        return UITableViewCell()
    }
}

