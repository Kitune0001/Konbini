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
    var fileName: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        textfild.delegate = self
        kibuntextfild.delegate = self
        textfild.attributedPlaceholder = NSAttributedString(string: "商品名",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        kibuntextfild.attributedPlaceholder = NSAttributedString(string: "今の気分は？",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textfild.setUnderLine()
        kibuntextfild.setUnderLine()
        kibuntextfild.isHidden = true
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
                try syouhin.filename = fileName
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
    @IBAction func food(){
        kibun = "ご飯"
        
    }
    @IBAction func drink(){
        
        kibun = "飲み物"
    }
    @IBAction func like(){
        
        kibun = "お気に入り"
    }
    @IBAction func etc(){
        
        kibuntextfild.isHidden = false
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
        
         fileName = "\(NSUUID().uuidString).png"
        
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

extension UITextField {
    func setUnderLine() {
        // 枠線を非表示にする
        borderStyle = .none
        let underline = UIView()
        // heightにはアンダーラインの高さを入れる
        underline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 3.5)
        // 枠線の色
        underline.backgroundColor = .white
        addSubview(underline)
        // 枠線を最前面に
        bringSubviewToFront(underline)
        
   
    }
}
