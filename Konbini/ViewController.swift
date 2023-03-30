//
//  ViewController.swift
//  Konbini
//
//  Created  on 2022/07/02.
//

import UIKit
import RealmSwift
class ViewController: UIViewController {
    
    
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
       }

    
   let realm = try! Realm()
   let syouhin = Syouhin()
    
    @IBOutlet var Button1:UIButton!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        

       }
      
        // Do any additional setup after loading the view.
    }



