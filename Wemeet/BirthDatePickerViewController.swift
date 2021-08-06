//
//  BirthDatePickerViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/04.
//

import UIKit

protocol NickNameDelegate {
    func didNickNameSave (_ controller: BirthDatePickerViewController, message: String)
    }

class BirthDatePickerViewController: UIViewController, BirthDayDelegate {
    var textName: String = ""
    var delegate: NickNameDelegate?
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var datePickerBirth: UIDatePicker!
    @IBOutlet var btnSend: UIButton!
    @IBOutlet var lblBirthDay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = textName + "님,"
        
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        if lblBirthDay.text!.count >= 1 && lblBirthDay.text! < formatter.string(from: date as Date) {
            btnSend.tintColor = UIColor.cyan
            performSegue(withIdentifier: "sgBirthDay", sender: self)
        } else {
            btnSend.tintColor = UIColor.systemGray5
        }
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerSend(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        lblBirthDay.text = formatter.string(from: datePickerView.date)
        if lblBirthDay.text!.count >= 1 && lblBirthDay.text! < formatter.string(from: NSDate() as Date) {
            btnSend.tintColor = UIColor.cyan
        } else {
            btnSend.tintColor = UIColor.systemGray5
        }
        datePickerBirth.maximumDate! = Date()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AlertViewController = segue.destination as! AlertViewController
        if segue.identifier == "sgBirthDay" {
            AlertViewController.textBirth = lblBirthDay.text!
            AlertViewController.textName = textName
            AlertViewController.delegate = self
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
    }
    
    func didBirthDaySave(_ controller: AlertViewController, message: String) {
        lblBirthDay.text = message
        lblName.text = message
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
