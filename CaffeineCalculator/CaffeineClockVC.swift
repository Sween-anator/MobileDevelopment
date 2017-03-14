//
//  CaffeineClockVC.swift
//  CaffeineCalculator
//
//  Created by Keagan Sweeney on 3/1/17.
//  Copyright © 2017 Keagan Sweeney. All rights reserved.
//

import UIKit

class CaffeineClockVC: UIViewController {

    @IBOutlet weak var halfLife: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var caffeineConsumedLbl: UILabel!
    
    private var _age:String!
    private var _weight:String!
    private var _caffeine:String!
    
    private var result = ""
    
    // Getter and Setter for variables
    var age: String{
        get{
            return _age
        } set {
            _age = newValue
        }
    }
    var weight: String{
        get{
            return _weight
        } set {
            _weight = newValue
        }
    }
    
    var caffeine: String{
        get{
            return _caffeine
        } set {
            _caffeine = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        halfLife.text = "The half-life for \(age)Mg of caffeine is 5.7 hours"
        weightLbl.text = _weight!
        caffeineConsumedLbl.text = "\(caffeine)mg"
        view.backgroundColor = UIColor.red
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func calculateCaffeine(age: String, weight: String, caffeine: String){
        result = "\(Int(caffeine)!  )"
    }

}
