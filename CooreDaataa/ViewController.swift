//
//  ViewController.swift
//  CooreDaataa
//
//  Created by Ravi Inder Manshahia on 12/11/18.
//  Copyright © 2018 Ravi Inder Manshahia. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        //SAVING DATA
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let User = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        User.setValue("Tanisah", forKey: "username")
        User.setValue("psdfgss", forKey: "password")
        User.setValue(32, forKey: "age")
        
        do
        {
            try context.save()
            print("Values asaved")
            
        } catch {
            print("Error while saving")
        }
        
        //Fetching DATA
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let username = result.value(forKey: "username") as? String
                    {
                        print(username)
                    }
                }
            }
        } catch {
            print("Error occured while fetching the results")
        }
        
    }
 
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
}

