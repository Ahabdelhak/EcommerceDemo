//
//  LoginViewController.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 26/01/2022.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegisterNavAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterationViewController") as? RegisterationViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnLoginNavAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
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
