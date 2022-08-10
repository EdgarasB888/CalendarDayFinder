//
//  HomeViewController.swift
//  CalendarDayFinder
//
//  Created by iMac on 2022-08-08.
//

import UIKit

class HomeViewController: UIViewController
{
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var findButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func findWeekDayTapped(_ sender: Any)
    {
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let day = Int(dayTextField.text ?? "0"), let month = Int(monthTextField.text ?? "0"), let year =  Int(yearTextField.text ?? "0") else
        {
            basicAlert(title: "Input Error!", message: "Date text fields cannot be empty!")
            
            return
        }
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_EN")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text
        {
            case "Find":
                findButton.setTitle("Clear", for: .normal)
                if day >= 1 && day <= 31 && month >= 1 && month <= 12
                {
                    let weekday = dateFormatter.string(from: date)
                    let capitalizedWeekday = weekday.capitalized
                    resultLable.text = capitalizedWeekday
                }
                else
                {
                    basicAlert(title: "Wrong date!", message: "Please enter correct date!")
                }
            default:
                findButton.setTitle("Find", for: .normal)
                clearTextFields()
        }
    }
    
    func clearTextFields()
    {
        dayTextField.text = ""
        monthTextField.text = ""
        yearTextField.text = ""
        resultLable.text = "Day of the week inside your finder"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "calculatedID"
        {
            guard let vc = segue.destination as? CalculatedDayViewController else {return}
            vc.calculatedDayValueText = resultLable.text ?? "No data detected!"
        }
    }
}

extension UIViewController
{
    func basicAlert(title: String?, message: String?){ DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
        
    }
}
