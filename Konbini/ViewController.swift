//
//  ViewController.swift
//  Konbini
//
//  Created  on 2022/07/02.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    
   let realm = try! Realm()
   let syouhin = Syouhin()
    
    @IBOutlet var Button1:UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        Button1.layer.cornerRadius = 75
        // Do any additional setup after loading the view.
    }

}

