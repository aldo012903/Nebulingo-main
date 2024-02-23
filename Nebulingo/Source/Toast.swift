//
//  Toast.swift
//  Nebulingo
//
//  Created by Aldo Lozano on 2023-11-10.
//

import UIKit

class Toast: UIAlertController {
    
    static func show( view : UIViewController, title : String, message : String, delay: Int) {
        
        let alert = UIAlertController(title:title, message:message, preferredStyle: .alert );
        
        view.present(alert, animated: true);
        
        let deadlineTime = DispatchTime.now() + .seconds(delay);
        
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            alert.dismiss(animated: true, completion: nil);
        })
        
    }
    
    
    
    static func ok ( view : UIViewController, title : String, message : String, handler: ((UIAlertAction) -> Void)? = nil ) {
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: handler))
        
        view.present(alert, animated: true)
    }
    
    
    static func confirm ( view : UIViewController, title : String, message : String, yesHandler: ((UIAlertAction) -> Void)?, noHandler: ((UIAlertAction) -> Void)? ) {
 
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: yesHandler))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: noHandler))

        view.present(alert, animated: true)
    }
    
}
