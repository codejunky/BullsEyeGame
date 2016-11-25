//
//  ViewController.swift
//  BullsEye
//
//  Created by Oussama Bouguerne on 11/22/16.
//  Copyright © 2016 MetaWorks Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startNewRound()
    updateLabels()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    let difference = abs(targetValue - currentValue)
    var points = 100 - difference
    
    let title: String
    if difference == 0 {
      title = "Perfect!"
      points += 100
    } else if difference < 5 {
      title = "You almost had it!"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "Pretty good!"
    } else {
      title = "Not even close..."
    }
    
    score += points
    
    let message = "You scored \(points) points"
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default,
                               handler: { action in
                                          self.startNewRound()
                                          self.updateLabels()
                                        })
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  
  @IBAction func startOverPressed(_ sender: Any) {
    score = 0
    round = 0
    startNewRound()
    updateLabels()
  }
  
  func startNewRound() {
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
    round += 1
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
}




















