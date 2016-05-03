//
//  ViewController.swift
//  TodoApp
//
//  Created by Alumno on 02/05/16.
//  Copyright © 2016 ITESM. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var randomNumber: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var userName: UILabel!
    var nameTable = String ()
    var targetValue: Int = 0
    var rounds: Int = 0
    var currentValue: Int = 0
    var score: Int = 0
    var diferencia: Int = 0
    @IBAction func hitMePreset(sender: AnyObject) {
        rounds++
        roundNumber.text=String(rounds)
        diferencia = abs(targetValue - Int(slider.value))
        let points = 100 - diferencia
        score += points
        let title: String
        if diferencia == 0 {
            title = "Perfect"
        } else if diferencia < 5{
            title = "You almost had it"
        } else if diferencia < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        let message = "You score \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        //butons
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {
            action in
            self.targetValue = 1 + Int(arc4random_uniform(100))
            self.randomNumber.text = "\(self.targetValue)"
            self.scoreLabel.text="\(self.score)"
            self.slider.value = 50
            
            
        })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    func generateRandomNumber()->Void{
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(currentValue)
        randomNumber.text=String(targetValue)
    }
    @IBAction func sliderMove(sender: AnyObject) {
        let slider : UISlider = sender as! UISlider
        currentValue = lroundf(slider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        userName.text = nameTable
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

