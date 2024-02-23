//
//  ViewController.swift
//  Nebulingo
//
//  Created by Francisco Vargas on 11/7/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnShowPassword: UIButton!
    
    
    //var userToLogin : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func SignUpTouchUpInside(_ sender: Any?) {
            self.performSegue(withIdentifier: Segue.toSignUpViewController, sender: self)
    }
    
    @IBAction func btnLogInTouchUpInside(_ sender: Any) {
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       
        if txtUsername.text!.isEmpty {
            Toast.ok(view: self, title: "Error", message: "Please insert an username")
            return false
        }
        if txtPassword.text!.isEmpty {
            Toast.ok(view: self, title: "Error", message: "Please insert the password")
            return false
        }

        let semaphore = DispatchSemaphore(value: 0)
        var shouldPerformSegue = false

        FrenchVerbAPI.signIn(email: txtUsername.text!, password: txtPassword.text!){ token, name in
            Context.loggedUserToken = token
            Context.userName = name
            shouldPerformSegue = true
            semaphore.signal()
        } failHandler: { httpStatusCode, errorMessage in
            print("failed with \(httpStatusCode)")
            semaphore.signal()
        }

        _ = semaphore.wait(timeout: .now() + 10) // para el que lea esto signifac espear 10 seg, si esta lento internet aumentale(no es la mejor forma pero mientras averiguo otra)

        if shouldPerformSegue {
            txtUsername.text = ""
            txtPassword.text = ""
            return true
        } else {
            Toast.ok(view: self, title: "Error", message: "Username or password credentials are invalid.")
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Segue.toHomeViewController {
            
        }
    }
    @IBAction func btnShowPasswordShow(_ sender: Any) {
        if(!txtPassword.isSecureTextEntry){
            txtPassword.isSecureTextEntry = true
            btnShowPassword.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            txtPassword.isSecureTextEntry = false
            btnShowPassword.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
}

