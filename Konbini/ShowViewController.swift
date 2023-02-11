//
//  ShowViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2023/01/21.
//

import UIKit

class ShowViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var Kibun:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = Kibun

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
