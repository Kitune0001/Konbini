//
//  FormViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2022/07/23.
//

import UIKit
import RealmSwift
class FormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textfild:UITextField!
    @IBOutlet weak var kibuntextfild:UITextField!
    
    let realm = try! Realm()
     
    let syouhin = Syouhin()
    
    
    
    
    
    var kibun : String!
    var name : String!
    var directoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    var selectdata: NSData? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        textfild.delegate = self
        kibuntextfild.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func save() {
        name = textfild.text
        kibun = kibuntextfild.text
        if name == "" || kibun == ""{
            let alert = UIAlertController(title: "No name", message: "Please insert the name", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }else{
            saveImage()
            syouhin.name = name
            syouhin.kibun = kibun
            //Kibunhairetu = kibun
           
            do {
                try syouhin.filename = directoryFileURL.absoluteString
            }catch{
                let alert = UIAlertController(title: "Cannot Save the Image", message: "", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default)
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            }
            
            try! realm.write{
                realm.add(syouhin)
                
            }
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
    
    func saveImage () {
        createLocalDataFile()
        
        let pngImageData = imageView.image?.pngData()
        do {
            try pngImageData!.write(to: directoryFileURL)
        } catch {
            
            print("エラー")
        }
    }
    func createLocalDataFile() {
        
        let fileName = "\(NSUUID().uuidString).png"
        
        if directoryFileURL != nil{
            
            let path = directoryFileURL.appendingPathComponent(fileName)
            directoryFileURL = path
        }
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
