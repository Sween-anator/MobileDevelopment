//
//  ViewController.swift
//  CaffeineCalculator
//
//  Created by Keagan Sweeney on 2/28/17.
//  Copyright © 2017 Keagan Sweeney. All rights reserved.
//

import UIKit

class InputVC: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var caffeineTxt: UITextField!
    
    // MARK: Actions
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer) {
        ageTxt.resignFirstResponder()
        weightTxt.resignFirstResponder()
        caffeineTxt.resignFirstResponder()
    }
    @IBAction func loadClockPressed(_ sender: Any) {
        performSegue(withIdentifier: "CaffeineClockVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any ) {
        if let destination = segue.destination as?
            CaffeineClockVC{
            
            // Things can go wrong here with the labels, check for bugs later
                destination.age = ageTxt.text!
                destination.weight = weightTxt.text!
                destination.caffeine = caffeineTxt.text!
            
        }
    }
}

