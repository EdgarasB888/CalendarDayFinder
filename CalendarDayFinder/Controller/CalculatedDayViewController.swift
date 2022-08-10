//
//  CalculatedDayViewController.swift
//  CalendarDayFinder
//
//  Created by iMac on 2022-08-10.
//

import UIKit

class CalculatedDayViewController: UIViewController
{
    @IBOutlet weak var calculatedDayLabel: UILabel!
    
    var calculatedDayValueText = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if !calculatedDayValueText.isEmpty && calculatedDayValueText != "Day of the week inside your finder"
        {
            calculatedDayLabel.text = calculatedDayValueText
        }
    }
}
