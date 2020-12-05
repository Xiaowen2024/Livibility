//
//  homeViewController.swift
//  Livibility
//
//  Created by 袁笑闻 on 2020/11/29.
//

import Foundation
import UIKit



class homeViewController: UIViewController  {
   
    
    @IBOutlet weak var journalNameTextField: UITextField!
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //journalNameTextField.delegate = self
    }
    
}

extension homeViewController : UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_textField: UITextField) -> Bool{
        
        return true
    }

}


