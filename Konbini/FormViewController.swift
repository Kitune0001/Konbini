//
//  FormViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2022/07/23.
//

import UIKit
import RealmSwift
class FormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    let realm = try! Realm()
    
    let syouhin = Syouhin()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textfild:UITextField!
    var kibunNumber: Int! = 0
    var selectdata: NSData? = nil
    @IBAction func save() {
        //        syouhinArray.name = UITextField.text
        syouhin.name = textfild.text
        syouhin.kibun = kibunNumber
        print(syouhin)
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
        textfild.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func first() {
        kibunNumber = 1
        print(kibunNumber)
    }
    @IBAction func second(){
        kibunNumber = 2
        print(kibunNumber)
    }
    @IBAction func third(){
        kibunNumber = 3
        print(kibunNumber)
    }
    @IBAction func fourth(){
        kibunNumber = 4
        print(kibunNumber)
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
