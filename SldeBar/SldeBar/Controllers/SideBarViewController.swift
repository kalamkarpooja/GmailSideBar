//
//  ViewController.swift
//  SldeBar
//
//  Created by Mac on 30/03/23.
//

import UIKit

class SideBarViewController: UIViewController {
    var settingVC : SettingViewController = SettingViewController()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bgBtn: UIButton!
    @IBOutlet weak var sideView: UIView!

    var data = ["All Inboxes","Social","Sent","Calender","Setting","Bin"]
    var image = ["inbox","social","sent","calender","setting","bin"]
    override func viewDidLoad() {
        super.viewDidLoad()
        bgBtn.isHidden = true
        sideView.isHidden = true
    }

    @IBAction func menuBtn(_ sender: UIButton) {
        sideView.isHidden = false
        bgBtn.isHidden = false
    }
    
    @IBAction func bgBtnClick(_ sender: Any) {
        sideView.isHidden = true
        bgBtn.isHidden = true
    }
}
extension SideBarViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.img.image = UIImage(named: image[indexPath.row])
        cell.titleLabel.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
        settingVC = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
            
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
        if indexPath.row == 5{
           let  binVC = storyboard?.instantiateViewController(withIdentifier: "BinViewController") as! BinViewController
                
            self.navigationController?.pushViewController(binVC, animated: true)
        }
    }
}
