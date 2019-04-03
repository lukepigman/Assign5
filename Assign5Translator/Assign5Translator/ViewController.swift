//
//  ViewController.swift
//  Assign5Translator
//
//  Created by Pigman, Luke on 3/25/19.
//  Copyright © 2019 Pigman, Luke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var translated: String = ""
    var languages: [String] = ["French", "German", "Malay", "Italian", "Spanish", "Danish", "Yiddish", "Swedish", "Japanese"]
    var tLangID: Int?

    override func viewDidLoad() {
    super.viewDidLoad()
        self.languagePicker.delegate = self
        self.languagePicker.dataSource = self
        outputLabel.text = translated
    }
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
   
   
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var languagePicker: UIPickerView!
    
    
    @IBAction func translate(_ sender: UIButton) {
       
        outputLabel.text = runTranslation()


    }
    
    func runTranslation() -> String {
        let picker = languagePicker.selectedRow(inComponent: 0)
        
        switch picker {
        case 0:
            tLangID = 2
        case 1:
            tLangID = 3
        case 2:
            tLangID = 4
        case 3:
            tLangID = 5
        case 4:
            tLangID = 6
        case 5:
            tLangID = 8
        case 6:
            tLangID = 9
        case 7:
            tLangID = 10
        case 8:
            tLangID = 11
        default:
            tLangID = 2
        }
        
        getTranslation(tLangID ?? 2)
        
        print(translated)
        DispatchQueue.main.async {
            self.outputLabel.text = self.translated
            self.outputLabel.text = self.translated
            self.outputLabel.setNeedsDisplay()
        }
        outputLabel.text = translated
        outputLabel.setNeedsDisplay()
        return translated
    }
    
  
 
    
    func getTranslation(_ idNumber: Int) {
        
        Translation.translateByID(id: idNumber, completionHandler: { (translate, error)  in
            
            if let error = error {
                // got an error in getting the data, need to handle it
                print("error calling POST on /todos")
                print(error)
                return
            }
            guard let translate = translate else {
                print("error getting translation: result is nil")
                return
            }
            // success :)
//            print(translate.baseWord)
//            print(translate.foreignWord)
            
            self.translated = translate.foreignWord
            
            
//            print("This was translated \(self.translated)")
           
            
           
        
        })
    
        
        
      
       
    }
   
    
   
   


}

