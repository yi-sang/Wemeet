//
//  MainMenuViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/06.
//

import UIKit

protocol PrivacyDelegate {
    func didPrivacySave (_ controller: MainMenuViewController, message: String)
    }

class MainMenuViewController: UIViewController {
    var textName: String = ""
    var textBirth: String = ""
    var textPhoneNumber: String = ""
    var delegate: PrivacyDelegate?
    
    @IBOutlet var btnNewAppointment: UIButton!
    @IBOutlet var btnCalender: UIButton!
    @IBOutlet var btnSetting: UIButton!
    @IBOutlet var btnPrivacy: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNewAppointment.layer.cornerRadius = 20
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        let titleString = NSAttributedString(string: "약속당일, 위치공유", attributes: titleAttributes)
        let messageAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 17)!]
        let messageString = NSAttributedString(string: "\n" + "친구들이 약속 장소에 잘 오고 있는지" + "\n" + "약속 시간 1시간 전부터 위치 공유를 할 수 있습니다.\n\n\n\n\n\n", attributes: messageAttributes)
        let margin:CGFloat = 10.0
        let rect = CGRect(x: margin*4, y: margin * 12, width: alertController.view.bounds.size.width - margin * 10.0, height: 110)
        let customView = UIImageView(image: UIImage(named: "map.png"))
        let cancil = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "자세히 보기", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.performSegue(withIdentifier: "sgWeb", sender: self)
        })
        customView.frame = rect
        alertController.view.addSubview(customView)
        confirm.setValue(UIColor.systemPurple, forKey: "titleTextColor")
        cancil.setValue(UIColor.gray, forKey: "titleTextColor")
        alertController.setValue(titleString, forKey: "attributedTitle")
        alertController.setValue(messageString, forKey: "attributedMessage")
        alertController.addAction(cancil)
        alertController.addAction(confirm)

        self.present(alertController, animated: true, completion:{})
    }
    // Do any additional setup after loading the view.
    @IBAction func btnCalender(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgCalender", sender: self)
    }
    
    
    @IBAction func btnNewAppointment(_ sender: UIButton) {
    }
    
    @IBAction func btnSetting(_ sender: UIButton) {
    }
    
    @IBAction func btnPrivacy(_ sender: UIButton) {
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
