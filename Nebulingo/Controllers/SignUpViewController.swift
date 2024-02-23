//
//  SignUpViewController.swift
//  Nebulingo
//
//  Created by Aldo Lozano on 2023-11-15.
//

import UIKit

class SignUpViewController: UIViewController {
        
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func btnLogInTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnShowPasswordShow(_ sender: Any) {
        if(!txtPassword.isSecureTextEntry){
            txtPassword.isSecureTextEntry = true
            txtConfirmPassword.isSecureTextEntry = true
            btnShowPassword.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            txtPassword.isSecureTextEntry = false
            txtConfirmPassword.isSecureTextEntry = false
            btnShowPassword.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    @IBAction func btnSingUp(_ sender: Any) {
        if txtUsername.text!.isEmpty {
            Toast.ok(view: self, title: "Error", message: "Please insert an username")
            return
        }
        if txtPassword.text!.isEmpty {
            Toast.ok(view: self, title: "Error", message: "Please insert the password")
            return
        }
        if txtConfirmPassword.text!.isEmpty {
            Toast.ok(view: self, title: "Error", message: "Please confirm the password")
            return
        }
        if txtConfirmPassword.text! != txtPassword.text! {
            Toast.ok(view: self, title: "Error", message: "Password doesn't")
            return
        }
        if txtName.text!.isEmpty {
            Toast.ok(view: self, title: "Error", message: "Please insert the name")
            return
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        var isSuccess = false
        var message = ""

        FrenchVerbAPI.signUp(email: txtUsername.text!, name: txtName.text!, password: txtPassword.text!) { userId in
            print(userId)
            isSuccess = true
            semaphore.signal()
        } failHandler: { httpStatusCode, errorMessage in
            print("failed with \(httpStatusCode)")
            message = errorMessage
            semaphore.signal()
        }


        _ = semaphore.wait(timeout: .now() + 10) // igual que en login

        if isSuccess {
            self.dismiss(animated: true)
        } else {
            Toast.ok(view: self, title: "Error", message: message)
        }
        
    }
}
