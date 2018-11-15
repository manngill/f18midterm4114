//
//  ViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    
    var context:NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else
        {
            return
            
        }
        
       
        self.context = appDelegate.persistentContainer.viewContext
        
    }




    override func didReceiveMemoryWarning()
{
        super.didReceiveMemoryWarning()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return person.count
    }


}



