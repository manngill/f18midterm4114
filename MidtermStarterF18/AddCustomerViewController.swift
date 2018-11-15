//
//  AddCustomerViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit

class AddCustomerViewController: UIViewController ,NSManagedObjectContext?
{

    // MARK: Outlets
    // ---------------------
    
    var person:AddCustomer!
    var personName:String = "";
    
    
    @IBOutlet weak var nameTextBox: UITextField!
    
    @IBOutlet weak var startingBalanceTextBox: UITextField!
    
    
    
    @IBOutlet weak var messageLabel: UILabel!
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var context:NSManagedObjectContext!
        

        
        // HINT HINT HINT HINT HINT
        // HINT HINT HINT HINT HINT
        // Code to create a random 4 digit string
        var x:String = ""
        repeat {
            // Create a string with a random number 0...9991
            x = String(format:"%04d", arc4random_uniform(9992) )
        } while x.count < 4
        
        print("Random value: \(x)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: Actions
    // ---------------------
    
    @IBAction func createAccountPressed(_ sender: Any) {
        print("you pressed the create account button!")
        
     
        let fetchRequest:NSFetchRequest<Person> = Person.fetchRequest()
        
      
        do {
           
            let person = try self.context.fetch(fetchRequest) as [Person]
            
           
            print("Number of  person in database: \(person.count)")
            
            for x in person {
                print("UserName: \(x.name)")
                print("Starting Balance: \(x.startingBalance)")
            }
        }
        catch {
            print("Error when fetching from database")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("STEP 1: HELLO!!!!")
        
        //let screen2 = segue.destination as! SearchResultsViewController
        //screen2.personName = self.searchTextBox.text!
        
        let editScreen = segue.destination as! EditUserViewController
        
        //SELECT * FROM User WHERE email = .....
        let fetchRequest:NSFetchRequest<User> = Person.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "Name == %@", "man@gmail.com")
        
        do {
            
            let person = try self.context.fetch(fetchRequest) as [User]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of persons in database: \(person.count)")
            
            if (person.count == 1) {
                editScreen.person = person[0] as Person
            }
            
        }
        catch {
            print("Error when fetching from database")
        }
        
        
    }
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
