//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Julia Romanenko on 29.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLable: UILabel!
    @IBOutlet var resultDescriptionLable: UILabel!
    
    var answers: [Answer]!
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        collectingDataFromScreens(from: answers)
        
        resultLable.text = "Вы - \(result)!"
        resultDescriptionLable.text = Animals(rawValue: result)?.definition
    }
    
    private func collectingDataFromScreens(from answers: [Answer]) {
        var store: [String:Int] = [:]
        
        for answer in answers {
            let animalSymbol = answer.animal.rawValue
            
            if store[animalSymbol] == nil {
                store[animalSymbol] = 1
            } else {
                store[animalSymbol]! += 1 // не понимаю откуда берется опционал и как сделать без "!"
            }
        }
        
        let filterAnimal = store.filter { (_, count) in
            count > 1
        }
        
        if filterAnimal.count > 1 {
            guard let animal = answers.first?.animal.rawValue else { return }
            result = animal
        } else {
            guard let resultFilter = filterAnimal.first?.key else { return }
            result = resultFilter
        }
    }
}
