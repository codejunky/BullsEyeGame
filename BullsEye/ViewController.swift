//
//  ViewController.swift
//  BullsEye
//
//  Created by Oussama Bouguerne on 11/22/16.
//  Copyright © 2016 MetaWorks Consulting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var currentValue: Int = 50
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func showAlert() {
    let message = "The value of the slider is: \(currentValue)"
    let alert = UIAlertController(title: "Hello, World",
                                  message: message,
                                  preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default,
                               handler: nil)
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
}




















