//
//  FormViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2022/07/23.
//

import UIKit
import RealmSwift
class FormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
   //let realm = try! Realm()
    
    let defaults = UserDefaults.standard
       var syouhinArray = [Syouhin]()
       //var image: UIImage!
    
//    let syouhin = Syouhin()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shouhinnametextfild:UITextField!
    var selectdata: NSData? = nil
    @IBAction func save() {
//        syouhin.name = shouhinnametextfild.text
//        syouhin.kibun = kibuntextfild.text
//        print(syouhin)
        //let data = image.pngData() as NSData?
                if let imageData = selectdata {
                    let syouhin = Syouhin(name: shouhinnametextfild.text, gazou: selectdata! as Data, kibun: kibuntextfild.text)
                    syouhinArray.append(syouhin)

                    //defaults.set(saveArray, forKey: "saveImage")
                    defaults.synchronize()
                }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func selectPicture(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            self.present(pickerView, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else{
            print("imagenotfound")
            return
        }
        imageView.image = image
        let data = image.pngData()! as NSData
        selectdata = data
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shouhinnametextfild.delegate = self
        kibuntextfild.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var kibuntextfild:UITextField!
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
