//
//  ShowViewController.swift
//  Konbini
//
//  Created by 秋武大介 on 2023/01/21.
//

import UIKit
import RealmSwift
class ShowViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var syouhingazou: UIImageView!
    let realm = try! Realm()
    var Kibun:String!
    var directoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    var syouhinname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Kibun)
        label.text = Kibun
        Load()
        // Do any additional setup after loading the view.
    }
    
    func Load(){
        let syouhin = realm.objects(Syouhin.self)
        print(syouhin)
        
        let findSyouhin = realm.objects(Syouhin.self).filter("kibun == %@", Kibun!)
        print(findSyouhin)
        let showsyouhin = findSyouhin.randomElement()
        let fileURL = directoryFileURL.appendingPathComponent((showsyouhin?.filename)!)
       
        print(fileURL)
        let filePath = fileURL.path
        print(filePath)
        
        if FileManager.default.fileExists(atPath: filePath){
            
            if let imageData = UIImage(contentsOfFile: filePath) {
                syouhingazou.image = imageData
            } else {
                print("エラー")
            }
        } else {
            print("エラー")
        }
        label.text = showsyouhin?.name
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
