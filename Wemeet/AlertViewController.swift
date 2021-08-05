//
//  AlertViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/04.
//

import UIKit

protocol BirthDayDelegate {
    func didBirthDaySave (_ controller: AlertViewController, message: String)
    }

class AlertViewController: UIViewController, PhoneNumberDelegate {
  
    
    var textName: String = ""
    var textBirth: String = ""
    var textPhoneNumber: String = "전화번호"
    var delegate: BirthDayDelegate?
    var flag = 0

    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var btnAlert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumber.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        textPhoneNumber = phoneNumber.text!
        
        if textPhoneNumber.count == 11 && Int(textPhoneNumber.prefix(11)) != nil{
            btnAlert.tintColor = UIColor.cyan
        } else {
            btnAlert.tintColor = UIColor.systemGray5
        }
        textPhoneNumber = phoneNumber.text!
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
  
    @IBAction func btnAlert(_ sender: UIButton) {
        textPhoneNumber = phoneNumber.text!
        if textPhoneNumber.count == 11 && Int(textPhoneNumber.prefix(11)) != nil{
            let phoneNumberCheckOnAlert = UIAlertController(title: textPhoneNumber, message: "본인 전화번호가 맞나요?", preferredStyle: UIAlertController.Style.alert)
            let modificationPhoneNumber = UIAlertAction(title: "연락처 수정", style: UIAlertAction.Style.default, handler: nil)
            modificationPhoneNumber.setValue(UIColor.gray, forKey: "titleTextColor")
            let confirmPhoneNumber = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {
                ACTION in
                self.performSegue(withIdentifier: "sgAlertAllowButton", sender: self)

            })
            phoneNumberCheckOnAlert.addAction(modificationPhoneNumber)
            phoneNumberCheckOnAlert.addAction(confirmPhoneNumber)
            present(phoneNumberCheckOnAlert, animated: true, completion: nil)
        } 
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AlertAllowViewController = segue.destination as! AlertAllowViewController
        if segue.identifier == "sgAlertAllowButton" {
            AlertAllowViewController.textBirth = self.textBirth
            AlertAllowViewController.textName = self.textName
            AlertAllowViewController.textPhoneNumber = self.textPhoneNumber
            AlertAllowViewController.delegate = self
        }
    }
    func didPhoneNumberSave(_ controller: AlertAllowViewController, message: String) {
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
