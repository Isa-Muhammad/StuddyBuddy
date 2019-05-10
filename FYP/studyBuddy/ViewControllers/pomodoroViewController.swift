//
//  pomodoroViewController.swift
//  studyBuddy
//
//  Created by Isa Muhammad on 19/04/2019.
//  Copyright © 2019 Isa Muhammad. All rights reserved.
//

import UIKit

class pomodoroViewController: UIViewController {
    
    var seconds = 60
    var timer = Timer()

    @IBOutlet weak var label: UILabel!
   
    
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int((sender.value))
        label.text = String(seconds)
    }
    
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func start(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(pomodoroViewController.counter), userInfo: nil, repeats: true)
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds)
        
        if (seconds == 0)
        {
            timer.invalidate()
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
        }
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stop(_ sender: Any)
    {
        timer.invalidate()
        seconds = 60
        sliderOutlet.setValue(60, animated: true)
        label.text = "60"
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
