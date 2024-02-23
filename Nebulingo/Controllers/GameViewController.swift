//
//  GameViewController.swift
//  Nebulingo
//
//  Created by jose salazar on 2023-12-01.
//

import UIKit

class GameViewController: UIViewController {
    
    var receivedVerb: FrenchVerb?
    var lives : Int?
    @IBOutlet weak var lblCurrent: UILabel!
    var level: String?
    @IBOutlet weak var txtVerb: UILabel!
    
    @IBOutlet weak var imgHeart1: UIImageView!
    @IBOutlet weak var imgHeart2: UIImageView!
    @IBOutlet weak var imgHeart3: UIImageView!
    private var imageStack : Stack<UIImageView>?
    
    @IBOutlet weak var txtTime: UILabel!
    @IBOutlet weak var txtLevel: UILabel!
    @IBAction func btnBackTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBOutlet weak var tvJe: UITextField!
    @IBOutlet weak var tvTu: UITextField!
    @IBOutlet weak var tvIl: UITextField!
    @IBOutlet weak var tvNous: UITextField!
    @IBOutlet weak var tvVous: UITextField!
    @IBOutlet weak var tvIls: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtVerb.text = receivedVerb?.verb
        txtLevel.text = level
        lives = 3
        imageStack = Stack<UIImageView>()
        imageStack?.push(imgHeart1)
        imageStack?.push(imgHeart2)
        imageStack?.push(imgHeart3)
        
        switch level{
        case "Beginner":
            txtTime.text = "Present"
            break;
        case "Intermidiate":
            txtTime.text = "Passe Compose"
            break;
        case "Advanced":
            txtTime.text = "Futur Simple"
            break;
        default:
            break;
        }
    }
    
    @IBAction func validateAns(_ sender: Any) {
        
        if tvJe.text?.isEmpty ?? true ||
               tvTu.text?.isEmpty ?? true ||
               tvIl.text?.isEmpty ?? true ||
               tvNous.text?.isEmpty ?? true ||
               tvVous.text?.isEmpty ?? true ||
            tvIls.text?.isEmpty ?? true {
            Toast.ok(view: self, title: "Error", message: "Please fill all the text fields.")
        }else{
            let verb = receivedVerb?.indicatif
            var error = false
            
            switch level{
            case "Beginner":
                let verbString = verb?.present?.i ?? ""
                let val_je = (verbString.contains("'")) ? "'" : " ";
                
                if(tvJe.text!.lowercased() == verb?.present?.i?.split(separator: val_je)[1] ?? "" ){
                    tvJe.backgroundColor = UIColor.green
                }else{
                    tvJe.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvTu.text!.lowercased() == verb?.present?.you?.split(separator: " ")[1] ?? ""){
                    tvTu.backgroundColor = UIColor.green
                }else{
                    tvTu.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvIl.text!.lowercased() == verb?.present?.heSheIt?.split(separator: " ")[1] ?? ""){
                    tvIl.backgroundColor = UIColor.green
                }else{
                    tvIl.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvNous.text!.lowercased() == verb?.present?.we?.split(separator: " ")[1] ?? ""){
                    tvNous.backgroundColor = UIColor.green
                }else{
                    tvNous.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvVous.text!.lowercased() == verb?.present?.youAll?.split(separator: " ")[1] ?? ""){
                    tvVous.backgroundColor = UIColor.green
                }else{
                    tvVous.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvIls.text!.lowercased() == verb?.present?.they?.split(separator: " ")[1] ?? ""){
                    tvIls.backgroundColor = UIColor.green
                }else{
                    tvIls.backgroundColor = UIColor.red
                    error = true
                }
                
                if error {
                    failAttemp()
                }
                else {
                    var alertActionHandler: (UIAlertAction) -> Void

                    alertActionHandler = { action in
                        self.dismiss(animated: true)
                    }
                    
                    Toast.ok(view: self, title: "You won :)", message: "You have guessed every verb! Maybe try another verb?", handler: alertActionHandler)
                }
                break;
            case "Intermidiate":
                txtTime.text = "Passe Compose"
                
                let verbString = verb?.passeCompose?.i ?? ""
                let val_je = (verbString.contains("'")) ? "'" : " ";
                var je = ""
                if (val_je == "'"){
                    if let splitResult = verb?.passeCompose?.i?.split(separator: "'").map(String.init), splitResult.count > 1 {
                            je = splitResult[1]
                        }
                }else{
                    let je_components = verb?.passeCompose?.i?.split(separator: " ").map(String.init) ?? []
                    je = je_components.count > 2 ? "\(je_components[1]) \(je_components[2].removingPercentEncoding ?? "")" : ""
                }
                
                if(tvJe.text!.lowercased() ==  je){
                    tvJe.backgroundColor = UIColor.green
                }else{
                    tvJe.backgroundColor = UIColor.red
                    error = true
                }
                
                let tu_components = verb?.passeCompose?.you?.split(separator: " ").map(String.init) ?? []
                let tu = tu_components.count > 2 ? "\(tu_components[1]) \(tu_components[2].removingPercentEncoding ?? "")" : ""

                if(tvTu.text!.lowercased() == tu){
                    tvTu.backgroundColor = UIColor.green
                }else{
                    tvTu.backgroundColor = UIColor.red
                    error = true
                }
                
                let ilElle_components = verb?.passeCompose?.heSheIt?.split(separator: " ").map(String.init) ?? []
                let ilElle = ilElle_components.count > 2 ? "\(ilElle_components[1]) \(ilElle_components[2].removingPercentEncoding ?? "")" : ""
                
                if(tvIl.text!.lowercased() == ilElle){
                    tvIl.backgroundColor = UIColor.green
                }else{
                    tvIl.backgroundColor = UIColor.red
                    error = true
                }
                
                let nous_components = verb?.passeCompose?.we?.split(separator: " ").map(String.init) ?? []
                let nous = nous_components.count > 2 ? "\(nous_components[1]) \(nous_components[2].removingPercentEncoding ?? "")" : ""
                
                if(tvNous.text!.lowercased() == nous){
                    tvNous.backgroundColor = UIColor.green
                }else{
                    tvNous.backgroundColor = UIColor.red
                    error = true
                }
                
                let vous_components = verb?.passeCompose?.youAll?.split(separator: " ").map(String.init) ?? []
                let vous = vous_components.count > 2 ? "\(vous_components[1]) \(vous_components[2].removingPercentEncoding ?? "")" : ""
                
                if(tvVous.text!.lowercased() == vous){
                    tvVous.backgroundColor = UIColor.green
                }else{
                    tvVous.backgroundColor = UIColor.red
                    error = true
                }
                
                let ils_components = verb?.passeCompose?.they?.split(separator: " ").map(String.init) ?? []
                let ils = ils_components.count > 2 ? "\(ils_components[1]) \(ils_components[2].removingPercentEncoding ?? "")" : ""
                
                if(tvIls.text!.lowercased() == ils){
                    tvIls.backgroundColor = UIColor.green
                }else{
                    tvIls.backgroundColor = UIColor.red
                    error = true
                }
                
                if error {
                    failAttemp()
                }
                else {
                    var alertActionHandler: (UIAlertAction) -> Void

                    alertActionHandler = { action in
                        self.dismiss(animated: true)
                    }
                    
                    Toast.ok(view: self, title: "You won :)", message: "You have guessed every verb! Maybe try another verb?", handler: alertActionHandler)
                }
                break;
            case "Advanced":
                txtTime.text = "Futur Simple"
                let verbString = verb?.futurSimple?.i ?? ""
                let val_je = (verbString.contains("'")) ? "'" : " ";
                
                if(tvJe.text!.lowercased() == verb?.futurSimple?.i?.split(separator: val_je)[1] ?? "" ){
                    tvJe.backgroundColor = UIColor.green
                }else{
                    tvJe.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvTu.text!.lowercased() == verb?.futurSimple?.you?.split(separator: " ")[1] ?? ""){
                    tvTu.backgroundColor = UIColor.green
                }else{
                    tvTu.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvIl.text!.lowercased() == verb?.futurSimple?.heSheIt?.split(separator: " ")[1] ?? ""){
                    tvIl.backgroundColor = UIColor.green
                }else{
                    tvIl.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvNous.text!.lowercased() == verb?.futurSimple?.we?.split(separator: " ")[1] ?? ""){
                    tvNous.backgroundColor = UIColor.green
                }else{
                    tvNous.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvVous.text!.lowercased() == verb?.futurSimple?.youAll?.split(separator: " ")[1] ?? ""){
                    tvVous.backgroundColor = UIColor.green
                }else{
                    tvVous.backgroundColor = UIColor.red
                    error = true
                }
                
                if(tvIls.text!.lowercased() == verb?.futurSimple?.they?.split(separator: " ")[1] ?? ""){
                    tvIls.backgroundColor = UIColor.green
                }else{
                    tvIls.backgroundColor = UIColor.red
                    error = true
                }
                
                if error {
                    failAttemp()
                }
                
                else {
                    var alertActionHandler: (UIAlertAction) -> Void

                    alertActionHandler = { action in
                        self.dismiss(animated: true)
                    }
                    
                    Toast.ok(view: self, title: "You won :)", message: "You have guessed every verb! Maybe try another verb?", handler: alertActionHandler)
                }
                
                break;
            default:
                break;
            }
        }
    }
    
    func failAttemp () {
        lives! -= 1
        var image = imageStack!.pop()
        image?.image = UIImage(systemName: "heart")
        
        if lives == 0 {
            var alertActionHandler: (UIAlertAction) -> Void

            alertActionHandler = { action in
                self.dismiss(animated: true)
            }
            
            Toast.ok(view: self, title: "You loss :(", message: "You have run out of lives! Maybe try another verb?", handler: alertActionHandler)
            
        }
    }
    
}
