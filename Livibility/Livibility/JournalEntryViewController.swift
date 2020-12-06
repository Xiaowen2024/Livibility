//
//  JournalEntry.swift
//  Livibility
//
//  Created by 袁笑闻 on 2020/11/17.
//


import UIKit
import CoreData

class JournalEntryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var context: NSManagedObject?
    
    @IBOutlet weak var journalEntryTable: UITableView!
    var journals: [(name:String,content:String)] = []
    @IBAction func doneDidTapped(_ sender: Any) {
        navigationController?.pushViewController(CalendarViewController, animated: true)
    
        
    }
    @IBAction func addDidTapped(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? addNewEntryViewController else {
                 return
             }
        self.present(addNewEntryViewController, animated: true) {
            navigationController?.pushViewController(addNewEntryViewController, animated: true)
            vc.title = "New Entry"
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.completion = {journalTitle，journal in
                self.navigationController?.popToRootViewController(animated: <#T##Bool#>)
                self.journals.append((name: journalTitle, content: journ))
                
                self.journalEntryTable.reloadData()
           
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
       
    
   
       override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = journals[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let journal = journals[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? journalViewController else {
                  return
              }
        vc.journalTitle = journal.name
        vc.journalContent = journal.content
        UINavigationController?.pushViewController(vc,animated:true)
        }
        
    }


