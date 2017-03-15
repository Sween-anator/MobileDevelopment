//
//  ViewController.swift
//  CaffeineCalculator
//
//  Created by Keagan Sweeney on 2/28/17.
//  Copyright © 2017 Keagan Sweeney. All rights reserved.
//

import UIKit

class InputVC: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var caffeineTxt: UITextField!
    
    @IBOutlet weak var savedCaffieneLbl: UILabel!
    
    let limitLength = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ageTxt.delegate = self
        let stringKey = UserDefaults.standard
        savedCaffieneLbl.text = stringKey.string(forKey: "savedStringKey")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let stringKey = UserDefaults.standard
        savedCaffieneLbl.text = stringKey.string(forKey: "savedStringKey")
        ageTxt.text = ""
        weightTxt.text = ""
        caffeineTxt.text = ""
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ageTxt.resignFirstResponder()
        weightTxt.resignFirstResponder()
        caffeineTxt.resignFirstResponder()
        return true
    }
    // MARK: Actions
    
    @IBAction func savedCaffeine(_ sender: Any) {
        let caffeineText = caffeineTxt.text
        
        // Create key
        UserDefaults.standard.set(caffeineText, forKey: "savedStringKey")
        UserDefaults.standard.synchronize()
        
//        let alert = UIAlertController(title: "Saved", message: "Caffeine consumed has been saved", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "A thing", style: .default) { action in
//            //action.title
//        })
//        self.present(alert, animated: true)
    }
    @IBAction func checkForInput(_ sender: Any) {
        
        if ageTxt.text?.isEmpty ?? true {
            // alert
            let alert = UIAlertController(title: "Enter Information", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        } else if weightTxt.text?.isEmpty ?? true {
            // alert
            let alert = UIAlertController(title: "Enter Information", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if caffeineTxt.text?.isEmpty ?? true {
            // alert
            let alert = UIAlertController(title: "Enter Information", message: "Please fill out all text fields.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "CaffeineClockVC", sender: self)
        }
    }
    
//    @IBAction func loadClockPressed(_ sender: Any) {
//        performSegue(withIdentifier: "CaffeineClockVC", sender: self)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if let destination = segue.destination as?
            CaffeineClockVC{
            
            // Things can go wrong here with the labels, check for bugs later
                destination.age = ageTxt.text!
                destination.weight = weightTxt.text!
                destination.caffeine = caffeineTxt.text!
            
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength // Bool
    }
}

