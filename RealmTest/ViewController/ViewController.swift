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
		
		//imprime no debugging do XCode o caminho do Realm Browser
		//Exemplo de como aparece no debugging, copie esta linha
		//e procure em seu computador pelo Realm Browser
		
		// /Users/meuUsuario/Library/Developer/CoreSimulator/Devices/3C04554B-2B36-4861-89D9-4270F9567423/data/Containers/Data/Application/E69F36AD-1DFA-49B4-AF0B-8D02DE198EE4/Documents/default.realm
		
		print(Realm.Configuration.defaultConfiguration.path!)
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
		//Desta forma todas as vezes que a tela for carregada, o nome Pedro sempre aparecerá
		
		let lastDog = realm.objects(Dog).filter("'Pedro'").last // O filter é usado para fazer a query e buscar aquele objeto desejado
		resultLabel.text = lastDog?.name
	}
}

