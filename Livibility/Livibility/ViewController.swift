//
//  ViewController.swift
//  Livibility
//
//  Created by 袁笑闻 on 2020/11/1.
//

import UIKit
import FSCalendar



@objc class CalendarViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource {
    @IBOutlet var calendar: FSCalendar!
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    fileprivate lazy var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate=self
        calendar.dataSource=self
       self.view.addSubview(calendar)
      
        self.view = view 
       
        calendar.appearance.headerTitleColor = UIColor.systemPurple
        calendar.appearance.weekdayTextColor = UIColor.systemIndigo
        //calendar.appearance.eventColor = UIColor.systemRed
        calendar.appearance.selectionColor = UIColor.systemBlue
        calendar.appearance.todayColor = UIColor.systemIndigo
        
        calendar.allowsMultipleSelection=true
        let todayItem = UIBarButtonItem(title: "TODAY", style: .plain, target: self, action: #selector(self.todayItemClicked(sender:)))
        self.navigationItem.rightBarButtonItem = todayItem
        // For UITest
        self.calendar.accessibilityIdentifier = "calendar"
        
    }
    
    @objc func todayItemClicked(sender: AnyObject) {
        self.calendar.setCurrentPage(Date(), animated: false)
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let navController = UINavigationController(rootViewController: JournalEntryViewController())
        
        //self.navigationController?.pushViewController(JournalEntryViewController(), animated: true)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print ("\(string)")
        self.present(navController, animated: true) {

        }
        
        //self.navigationController?.pushViewController(JournalEntryViewController(), animated: true)
       
    }
}
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MM-dd-YYYY"
        let string = formatter.string(from: date)
        print ("\(string)")
    
        
    }
  //  func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
      //  let dateString = self.dateFormatter2.string(from: date)
        //if self.datesWithEvent.contains(dateString) {
           // return 1
       // }
     //   if self.datesWithMultipleEvents.contains(dateString) {
         //   return 3
     //   }
       // return 0
   // }
   // func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
       // let key = self.dateFormatter2.string(from: date)
       // if self.datesWithMultipleEvents.contains(key) {
           // return [UIColor.magenta, appearance.eventDefaultColor, UIColor.black]
        //}
      //  return nil
    //}
    




