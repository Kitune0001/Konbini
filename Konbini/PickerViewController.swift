//
//  PickerViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2023/01/21.
//

import UIKit
import RealmSwift

 
class PickerViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var pickerView: UIPickerView!
    
    var Kibun:String!
   
    let dataList = [
        "お腹すいた","喉乾いた","眠気打破","小腹満たし",
        
    ]
    let realm = try! Realm()
    var karikibunList :Set<String>!
    var kibunList : [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         karikibunList = Set(realm.objects(Syouhin.self).value(forKey: "kibun") as! [String])
        kibunList = Array(karikibunList).sorted()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        label.text = "気分"
        
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return kibunList.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return kibunList[row]
    }
    
   
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        label.text = kibunList[row]
      
        Kibun = kibunList[row]
        print(Kibun)
        
        
        
    }
    
    
    @IBAction func byNavicationPush(_ sender: Any) {
          let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowView") as! ShowViewController
          nextVC.Kibun = Kibun
          self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

