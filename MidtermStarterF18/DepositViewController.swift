 //
//  DepositViewController.swift
//  MidtermStarterF18
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController ,NSManagedObjectContext!
{

    // MARK: Outlets
    // ---------------------
    var name:String = "";
     var context:NSManagedObjectContext!
    @IBOutlet weak var customerIdTextBox: UITextField!
    @IBOutlet weak var balanceLabel: UILabel!

    @IBOutlet weak var depositAmountTextBox: UITextField!
    @IBOutlet weak var messagesLabel: UILabel!
    
    // MARK: Default Functions
    // ---------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        print("You are on the Check Balance screen!")
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        self.context = appDelegate.persistentContainer.viewContext
        
     
       
        let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate =  NSPredicate(format: "name == %@", self.name)
        
        do {
            let results = try self.context.fetch(fetchRequest) as [AddCustomer]
            
            
            print("Number of items in database: \(results.count)")
            
            if (results.count == 1) {
                let x = results[0] as AddCustomer
                name.text = x.name!
                startingBalance.text = x.startingBalance!
            }
            else if (results.count == 0) {
                name.text = "Error, no results found!"
            }
            else if (results.count > 1) {
                name.text = "Sorry, more than 1 result found!"
            }
            
        }
        catch {
            print("Error when fetching from database")
        }
        
    }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    // MARK: Actions
    // ---------------------
    
    
    @IBAction func checkBalancePressed(_ sender: Any) {
        print("check balance button pressed!")
    }
    
    
    @IBAction func depositButtonPressed(_ sender: Any) {
        print("you pressed the deposit button!")
    }
    
    
    @IBAction func showCustomersPressed(_ sender: Any) {
        print("Show customers button pressed!")
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
