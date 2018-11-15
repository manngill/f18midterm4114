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
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
       
        self.context = appDelegate.persistentContainer.viewContext
        
    }
    
    }

func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




