//
//  AlertAllowViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/05.
//

import UIKit

protocol PhoneNumberDelegate {
    func didPhoneNumberSave (_ controller: AlertAllowViewController, message: String)
    }

class AlertAllowViewController: UIViewController {
    var textName: String = ""
    var textBirth: String = ""
    var textPhoneNumber: String = ""
    var cnt = 0
    var delegate: PhoneNumberDelegate?
    @IBOutlet var successImageView: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblWelcome: UILabel!
    @IBOutlet var lblSuccess: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let time = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.runningAfter5Seconds()
            self.lblName.text = self.textName + "님,"
            self.lblWelcome.text = "환영합니다."
            self.lblSuccess.text = "가입 완료"
        }
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAlert(_ sender: UIButton) {
        let allowOnAlert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        let titleString = NSAttributedString(string: "이용약관 동의(전체)", attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!]
        let messageString = NSAttributedString(string: "\n" + "개인정보 수집 및 이용약관에 동의하시나요?", attributes: messageAttributes)
        allowOnAlert.setValue(titleString, forKey: "attributedTitle")
        allowOnAlert.setValue(messageString, forKey: "attributedMessage")

        let cancil = UIAlertAction(title: "동의하지 않습니다.", style: UIAlertAction.Style.default, handler: nil)
        cancil.setValue(UIColor.gray, forKey: "titleTextColor")
        let confirm = UIAlertAction(title: "동의하고 시작하기", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.performSegue(withIdentifier: "sgMenu", sender: self)
        })
        allowOnAlert.addAction(cancil)
        allowOnAlert.addAction(confirm)
        present(allowOnAlert, animated: true, completion: nil)
    }

    func runningAfter5Seconds() {
        self.successImageView.tintColor = UIColor.cyan
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
