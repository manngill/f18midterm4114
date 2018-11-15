 //
//  DepositViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
 import CoreData

class DepositViewController: UIViewController
    
{

    var person:String = "";
    var name:String = "";
    var context:NSManagedObjectContext!
    
    
    @IBOutlet weak var customerIdTextBox: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!

    @IBOutlet weak var depositAmountTextBox: UITextField!
    @IBOutlet weak var messagesLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        self.context = appDelegate.persistentContainer.viewContext
        
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        
        
        
    }
    
    @IBAction func checkBalancePressed(_ sender: Any) {
        
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "customerId == %@", customerIdTextBox.text!);
        
        
        do {
            
            let person = try self.context.fetch(fetchRequest) as [Customer]
            
            
            print("Number of person in database: \(person.count)")
            
            for x in person {
                balanceLabel.text = "\(x.startingBalance)"
            }
        }
        catch {
            print("Could not find person")
        }
    }
    
func depositeButtonPressed(_ sender: Any) {
        
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        
        do {
          
            let person = try self.context.fetch(fetchRequest) as [Customer]
            
            
            print("Number of person in database: \(person.count)")
            
            for x in person {
                print("User Name: \(x.name)")
                print("Starting Balance: \(x.startingBalance)")
            }
        }
        catch {
            print("Could not find person")
        }
}

        
        
        
        

    @IBAction func showCustomerPressed(_ sender: Any) {
    }
 }
