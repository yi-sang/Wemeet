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

class AlertViewController: UIViewController {
    var textName: String = ""
    var textBirth: String = ""
    var textPhoneNumber: String = "전화번호"
    var delegate: BirthDayDelegate?

    @IBOutlet var nickName: UILabel!
    @IBOutlet var birthDay: UILabel!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var btnAlert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumber.text = textPhoneNumber
        birthDay.text = "생일 : " + textBirth
        nickName.text = "이름 : " + textName
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAlert(_ sender: UIButton) {
        textPhoneNumber = phoneNumber.text!
        if textPhoneNumber.count == 11 {
            btnAlert.tintColor = UIColor.cyan
            let phoneNumberCheckOnAlert = UIAlertController(title: textPhoneNumber + "\n" + textBirth + "\n" + textName, message: "본인 전화번호가 맞나요?", preferredStyle: UIAlertController.Style.alert)
            let modificationPhoneNumber = UIAlertAction(title: "연락처 수정", style: UIAlertAction.Style.default, handler: nil)
//            let confirmPhoneNumber = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {
//            })
            
            phoneNumberCheckOnAlert.addAction(modificationPhoneNumber)
//            phoneNumberCheckOnAlert.addAction(confirmPhoneNumber)
            present(phoneNumberCheckOnAlert, animated: true, completion: nil)
        }
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
