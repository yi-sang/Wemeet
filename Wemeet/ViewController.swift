//
//  ViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/04.
//

import UIKit

class ViewController: UIViewController, NickNameDelegate {
    var textName: String = ""
    @IBOutlet var txtName: UITextField!
    @IBOutlet var btnSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.addTarget(self, action: #selector(textFieldDidChange(textField:)),
            for: UIControl.Event.editingChanged)
        // Do any additional setup after loading the view.
    }

    
    @objc func textFieldDidChange(textField: UITextField){
        textName = txtName.text!
        if textName.count >= 1 {
            btnSend.tintColor = UIColor.cyan
        } else {
            btnSend.tintColor = UIColor.systemGray5
        }
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        if textName.count >= 1 {
            btnSend.tintColor = UIColor.cyan
            performSegue(withIdentifier: "sgNickName", sender: self)
        }  else {
            btnSend.tintColor = UIColor.systemGray5
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let BirthDatePickerViewController = segue.destination as! BirthDatePickerViewController
        if segue.identifier == "sgNickName" {
            BirthDatePickerViewController.textName = txtName.text!
            BirthDatePickerViewController.delegate = self
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
    }
    
 
    
    func didNickNameSave (_ controller: BirthDatePickerViewController, message: String) {
        txtName.text = message
    }
        
}

