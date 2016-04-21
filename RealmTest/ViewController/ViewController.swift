//
//  ViewController.swift
//  RealmTest
//
//  Created by Marcio Habigzang Brufatto on 4/21/16.
//  Copyright © 2016 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func add(sender: AnyObject) {
        
        let myDog = Dog()
        myDog.name = textView.text!
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(myDog)
        }
        
        let lastDog = realm.objects(Dog).last
        resultLabel.text = lastDog!.name
    }
}

