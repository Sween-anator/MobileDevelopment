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
    @IBOutlet weak var countDownLbl: UILabel!
    @IBOutlet weak var caffeineConsumedLbl: UILabel!
    @IBOutlet weak var timeOfCrash: UILabel!
    
    private var _age:String!
    private var _weight:String!
    private var _caffeine:String!
    
    private var result = ""
    
    
    // Actual time
    var hourT: Int = 0
    var minuteT: Int = 0
    var secondT: Int = 0
    var caffeineT: Int = 0
    var now = Date()
    
    
    let dateFormatter = DateFormatter()
    //dateFormatter.dateStyle = .MediumStyle
    
    let timeFormatter = DateFormatter()
    var amOrPm = ""
    
    
    
    // Time remaining
    var hr: Int = 5
    var min: Int = 45
    var sec: Int = 00
    
    var timer = Timer()
    
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
        
        timeFormatter.dateFormat = "a"
        
        hourT = hour()
        minuteT = minute()
        secondT = second()
        caffeineT = metabolismRate()
        caffeineT = endingTime(caffeine: caffeineT)
        amOrPm = getTimeOfDay()
        
        caffeineConsumedLbl.text = "\(caffeine)mg"
        
        halfLife.text = "The half-life for \(caffeine)Mg of caffeine is between 4 and 6 hours resulting in \(calculateCaffeine(caffeine: caffeine))Mg."
    
        
        timeOfCrash.text = "\(caffeineT) : \(String(format: "%02d", arguments: [minuteT])) \(amOrPm)"
        
        countDownLbl.text = ""
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: (#selector(CaffeineClockVC.calculateTimeRemaining)), userInfo: nil, repeats: true)
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func metabolismRate() -> Int{
        // AGE
        if Int(age)! <= 28 {
            // 4 hours
            caffeineT = hourT + 4
            hr = 4
        } else if Int(age)! > 28 && Int(age)! < 41{
            // 5 hours
            caffeineT = hourT + 5
            hr = 5
        } else {
            // 6 hours
            caffeineT = hourT + 6
            hr = 6
        }
        
        
        return caffeineT
    }
    
    func calculateCaffeine(caffeine: String) -> String{
        result = "\(Int(caffeine)! / 2 )"
        
        return "\(result)"
    }
    
    func hour() -> Int{
        let hour = Calendar.current.component(.hour, from: Date())
        
        return hour
    }
    func minute() -> Int{
        let minute = Calendar.current.component(.minute, from: Date())
        
        return minute
    }
    
    func second() -> Int {
        let second = Calendar.current.component(.second, from: Date())
        
        return second
    }
    
    func endingTime(caffeine: Int) -> Int{
        var temp = caffeine
        if temp > 24 {
            temp -= 24
        } else if temp > 12 {
            temp -= 12
        }
        
        return temp
    }
    
    func getTimeOfDay() -> String{
        if timeFormatter.string(from: now) == "AM"{
            amOrPm = "PM"
        } else {
            amOrPm = "AM"
        }
        
        return amOrPm
        
    }
    func calculateTimeRemaining(){
        
        if hr > 0 && min == 0 && sec == 0{
            hr -= 1
            min = 59
        } else if min > 0 && sec == 0{
            min -= 1
            sec = 59
        } else {
            sec -= 1
        }
        
        if min == 0 && hr == 0 && sec == 0{
            timer.invalidate()
        }
        
        countDownLbl.text = "\(hr) : \(String(format: "%02d", arguments: [min])) : \(String(format: "%02d", arguments: [sec]))"
    }

}
