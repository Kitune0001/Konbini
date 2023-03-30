//
//  PickerViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2023/01/21.
//

import UIKit
import RealmSwift

 
class PickerViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var pickerView: UIPickerView!
    //@IBOutlet weak var btnCancel: UIButton!
    //@IBOutlet weak var btnConfirmation: UIButton!
    
    var Kibun:String!
   
    var dataList = [
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
    
    //@objc func tapBtnCancel(_ sender: UIButton) {
        //self.dismiss(animated: true)
    //}
    
    //@/objc func tapBtnConfirmation(_ sender: UIButton) {
        //let selected = dataList[self.pickerView.selectedRow(inComponent: 0)]
        //self.dismiss(animated: true)
    //}

    
    
    @IBAction func byNavicationPush(_ sender: Any) {
          let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ShowView") as! ShowViewController
          nextVC.Kibun = Kibun
          self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

extension PickerViewController: UIPickerViewDataSource {
    
    
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
   
}

extension PickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        pickerLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        pickerLabel.text = kibunList[row]
        pickerLabel.font = UIFont(name: "Helvetica", size: 22)
        pickerLabel.textAlignment = NSTextAlignment.center
        
        pickerLabel.layer.cornerRadius = pickerLabel.frame.height/2.0
        pickerLabel.backgroundColor = #colorLiteral(red: 0.9468494058, green: 0.9369241595, blue: 1, alpha: 1)
        
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        label.text = kibunList[row]
      
        Kibun = kibunList[row]
        print(Kibun)
        
        
        
    }
   
}
     //#colorLiteral(red: 0.6829224825, green: 0.6091368198, blue: 0.9736139178, alpha: 1)
