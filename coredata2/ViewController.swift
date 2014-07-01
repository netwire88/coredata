//
//  ViewController.swift
//  coredata2
//
//  Created by Dean Chen on 7/1/14.
//  Copyright (c) 2014 Corklabs. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField
    @IBOutlet var passwordTextField: UITextField
                            
    @IBAction func tappedLoad(sender: AnyObject) {
//        println("Tapped Load Button \(usernameTextField.text)")
        var appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)  //casts UIAppDelegate to AppDelegate
        var context:NSManagedObjectContext = appDelegate.managedObjectContext

        var request = NSFetchRequest(entityName: "Users")  //creates request
        request.returnsObjectsAsFaults = false  //don't get obj back until it's cast to managedObject
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)   //executes request
        
        if (results.count > 0) {
            for result in results {
                println(result)
            }
        } else {
            println("0 results returned...")
        }
        
    }
    
    @IBAction func tappedSave(sender: AnyObject) {
        //        println("Tapped Save Button \(passwordTextField.text)")
        var appDelegate:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)  //casts UIAppDelegate to AppDelegate
        var context:NSManagedObjectContext = appDelegate.managedObjectContext
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue(usernameTextField.text, forKey: "username")  //same name as Entity attribute
        newUser.setValue(passwordTextField.text, forKey: "password")
        context.save(nil)
        println(newUser)
        println("Object Saved.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

