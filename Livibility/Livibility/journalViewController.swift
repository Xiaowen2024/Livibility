//
//  journalViewController.swift
//  Livibility
//
//  Created by 袁笑闻 on 2020/12/5.
//

import Foundation
import CoreData
import UIKit

class journalViewController:UIViewController{
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!
    
    @IBAction func backToJournalEntry(_ sender: Any) {
        performSegue(withIdentifier: "backToJournalEntry", sender: self)
        
    }
    public var journalTitle:String = ""
    public var journalContent:String = ""
    override func viewDidLoad() {
           
        super.viewDidLoad()
        
        nameLabel.text = journalTitle
        contentLabel.text = journalContent
    
            
        }
        
    }
