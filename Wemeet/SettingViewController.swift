//
//  SettingViewController.swift
//  Wemeet
//
//  Created by 이상현 on 2021/08/07.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var btnLogout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnLogout(_ sender: UIButton) {
        self.performSegue(withIdentifier: "sgLogout", sender: self)
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
