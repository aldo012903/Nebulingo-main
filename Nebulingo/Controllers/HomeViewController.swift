//
//  HomeViewController.swift
//  Nebulingo
//
//  Created by Aldo Lozano on 2023-11-15.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    //var options = VerbProvider.allVerbs;
    var options: [String]?
    var selectedVerb: String?;
    var level: String?
    var senderVerb: FrenchVerb?
    @IBOutlet weak var lblName: UILabel!

    @IBOutlet weak var imgDuo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgDuo.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imgDuo.addGestureRecognizer(tapGesture)
        
        picker.dataSource = self
        picker.delegate = self
        lblName.text = Context.userName
        //VerbProvider.generateVerbData()
        //options = VerbProvider.allVerbs
        //options = []
        
        FrenchVerbAPI.getRandomVerbs(number: 30, successHandler: { verbs in
            DispatchQueue.main.async {
                self.options = verbs
                self.selectedVerb = verbs.first
                self.picker.reloadAllComponents()
            }
        }, failHandler: { httpStatusCode, errorMessage in
            print("failed with \(httpStatusCode) - \(errorMessage)")
        })
        //selectedVerb = options[0]
    }
    @objc func imageTapped() {
            let shakeAnimation = CABasicAnimation(keyPath: "position")
            shakeAnimation.duration = 0.07
            shakeAnimation.repeatCount = 4
            shakeAnimation.autoreverses = true
            shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: imgDuo.center.x - 5, y: imgDuo.center.y))
            shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: imgDuo.center.x + 5, y: imgDuo.center.y))
            
        imgDuo.layer.add(shakeAnimation, forKey: "position")
        }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options?.count ?? 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options?[row]
        }

        // Manejar la selección del usuario en el picker
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Aquí puedes manejar lo que sucede cuando el usuario selecciona una opción
        // textField.text = options[row]
        selectedVerb = options?[row]
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       
        let semaphore = DispatchSemaphore(value: 0)
        var shouldPerformSegue = false

        FrenchVerbAPI.getVerb(verb: selectedVerb ?? "") { verb in
            
            self.senderVerb = verb
            shouldPerformSegue = true
            semaphore.signal()
        } failHandler: { httpStatusCode, errorMessage in
            print("Failed with httpCode \(httpStatusCode) - \(errorMessage)")
            Toast.ok(view: self, title: "Error", message: "Failed with httpCode \(httpStatusCode) - \(errorMessage)")
            semaphore.signal()
        }


        _ = semaphore.wait(timeout: .now() + 10) // para el que lea esto signifac espear 10 seg, si esta lento internet aumentale(no es la mejor forma pero mientras averiguo otra)

        if shouldPerformSegue {
            return true
        } else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
        FrenchVerbAPI.getVerb(verb: selectedVerb ?? "") { verb in
            DispatchQueue.main.async {
                self.senderVerb = verb
                
            }
        } failHandler: { httpStatusCode, errorMessage in
            print("Failed with httpCode \(httpStatusCode) - \(errorMessage)")
        }*/
        (segue.destination as! GameViewController).receivedVerb = self.senderVerb
        (segue.destination as! GameViewController).level = level
    }
    @IBAction func btnBeginnerTouchUpInside(_ sender: Any) {
        level = "Beginner";
    }
    @IBAction func btnLogOut(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func btnIntermidiateTouchUpInside(_ sender: Any) {
        level = "Intermidiate";
    }
    @IBAction func btnAdvancedTouchUpInside(_ sender: Any) {
        level = "Advanced";
    }
    
    @IBAction func selectRandomVerb(_ sender: UIButton) {
        if let optionsCount = options?.count, optionsCount > 0 {
            let randomIndex = Int.random(in: 0..<optionsCount)
            picker.selectRow(randomIndex, inComponent: 0, animated: true)
            pickerView(picker, didSelectRow: randomIndex, inComponent: 0)
        }
    }
}
