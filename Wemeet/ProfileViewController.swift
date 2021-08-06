//
//  ProfileViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/07.
//

import UIKit

class ProfileViewController: UIViewController {
    var textName: String = ""
    var textBirth: String = ""
    var textPhoneNumber: String = ""
    
    @IBOutlet var imageViewProfile: UIImageView!
    @IBOutlet var lblNickName: UILabel!
    @IBOutlet var lblBirthDay: UILabel!
    @IBOutlet var lblPhoneNumber: UILabel!
    @IBOutlet var btnProfileModification: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewProfile.image = UIImage(named: "도우도우.png")
        lblNickName.text = textName
        lblBirthDay.text = textBirth
        lblPhoneNumber.text = textPhoneNumber
        // Do any additional setup after loading the view.
    }
    @IBAction func btnProfielModification(_ sender: UIButton) {
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
