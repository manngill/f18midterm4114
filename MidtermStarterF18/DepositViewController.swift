 //
//  DepositViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController
    
{

    var person:Person!
    var name:String = "";
      var context:NSManagedObjectContext!
    
    
    @IBOutlet weak var customerIdTextBox: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!

    @IBOutlet weak var depositAmountTextBox: UITextField!
    @IBOutlet weak var messagesLabel: UILabel!
    
    @IBAction func checkBalancePressed(_ sender: Any) {
        
        person.name = nameTextBox.text!
        person.startingBalance = startingBalanceTextBox.text!
        
        do {
          
            try self.person.save()
            print("Saved to database!")
        }
        catch {
            print("Error while saving to database")
        }
        
        
    }
        
        
    }
    
func depositeButtonPressed(_ sender: Any) {
        
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
          
            let person = try self.person.fetch(fetchRequest) as [Person]
            
            
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        print("You are on the Check Balance screen!")
        
       

        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
