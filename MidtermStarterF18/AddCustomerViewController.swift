//
//  AddCustomerViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreData

class AddCustomerViewController: UIViewController
    
{

  
    var person:Int = 0;
    var personName:String = "";
     
    
    
    @IBOutlet weak var nameTextBox: UITextField!
    
    @IBOutlet weak var startingBalanceTextBox: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
     var context:NSManagedObjectContext!
    
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    self.context = appDelegate.persistentContainer.viewContext

    
   // var person = NSManagedObjectContext?()
        

        
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

 
    @IBAction func createAccountPressed(_ sender: Any) {
        print("you pressed the create account button!")
        
     //   let p = person(context: self.context)
        
      //  p.name = nameTextBox.text!
      //  p.startingBalance = startingBalanceTextBox.text!
        
        var x:String = ""
        repeat
        {
            
            x = String(format:"%04d", arc4random_uniform(9992) )
        } while x.count < 4
        
        print("Random value: \(x)")
        let u = Customer(context: self.context)
        u.name = nameTextBox.text!
        u.startingBalance = Double(startingBalanceTextBox.text!)!
        
        do {
            // Save the user to the database
            // (Send the INSERT to the database)
            try self.context.save()
            print("Saved to database!")
        }
        catch {
            print("Error while saving to database")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Adding Customers")
        
      
      
        
        let DepositScreen = segue.destination as! DepositViewController
        
       
        let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "Name == %@", "man@gmail.com")
        
        do {
            
            let person = try self.context.fetch(fetchRequest) as [Customer]
            
            // Loop through the database results and output each "row" to the screen
            print("Number of persons in database: \(person.count)")
            
          //  if (person.count == 1) {
             //   DepositScreen.person = person[0] as Person
           // }
            
        }
        catch {
            print("Could Not Find")
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


