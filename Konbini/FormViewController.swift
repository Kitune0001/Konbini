//
//  FormViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2022/07/23.
//

import UIKit

class FormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    
    var syouhinArray = [Syouhin]()
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textfild:UITextField!
    var kibunnamber: Int! = 0
    var selectdata: NSData? = nil
    @IBAction func save() {
//        syouhinArray.name = UITextField.text
        let syouhins = Syouhin(name: textfild.text!,kibun: kibunnamber,gazou: selectdata! as Data)
        
        self.dismiss(animated: true, completion: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
