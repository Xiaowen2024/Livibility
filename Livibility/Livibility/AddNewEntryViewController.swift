//
//  AddNewEntryViewController.swift
//  Livibility
//
//  Created by 袁笑闻 on 2020/11/17.
//

import Foundation
import UIKit
import CoreData

class addNewEntryViewController:UIViewController{
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var journalField: UITextView!
    @IBAction func saveJournal(_ sender: Any) {
        if let text = titleField.text,!text.isEmpty,!journalField.text.isEmpty{
            completion(text,journalField.text)
        }
    }
    
    public var completion:((string,String)-> Void)
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        
    }
    
}

