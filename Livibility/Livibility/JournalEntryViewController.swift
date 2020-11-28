//
//  JournalEntry.swift
//  Livibility
//
//  Created by 袁笑闻 on 2020/11/17.
//

import Foundation
import UIKit
import CoreData

class JournalEntryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var entries: [Journal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Journals"
        
        self.tableView.estimatedRowHeight = 44
    
        
     //   self.tableView.rowHeight = UITableViewAutomaticDimension
 
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addEntries"{
            let controller = segue.destination as! addNewEntryViewController
    
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    
    func fetchData() {
        
        do {
            entries = try context.fetch(Journal.fetchRequest())
            print(entries)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
        
    }

}


extension JournalEntryViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        let date = entries.reversed()[indexPath.row].date
        let time = entries.reversed()[indexPath.row].time
        
        cell.textLabel?.text = entries.reversed()[indexPath.row].name
        
        if let date = date, let time = time {
            let timeStamp = "Added on \(date) at \(time)"
            cell.detailTextLabel?.text = timeStamp

        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return entries.count
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(entries[indexPath.row].name!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
            
            let entry = self.entries[indexPath.row]
            self.context.delete(entry)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            self.entries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            // delete item at indexPath
            
            print("Share")
            
        }
        
        delete.backgroundColor = UIColor(red: 0/255, green: 177/255, blue: 106/255, alpha: 1.0)
        share.backgroundColor = UIColor(red: 54/255, green: 215/255, blue: 183/255, alpha: 1.0)

        
        return [delete,share]
        
    }
    
    
}

