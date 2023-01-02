//
//  ViewController.swift
//  aminSIM1
//
//  Created by chekir walid on 2/1/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iimageIMG: UIImageView!
    @IBOutlet weak var usernameTXTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func redBTNPressed(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Red")
    }
    
    @IBAction func yellowBTNPressed(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Yellow")
    }
    
    @IBAction func brownBTNPressed(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Brown")
    }
    
    @IBAction func tealBTNPressed(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Light-blue")
    }
    
    @IBAction func orangeBTNPressed(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Orange")
    }
    
    @IBAction func purpleBTNPressd(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Purple")
    }
    
    @IBAction func pinkBTNPressed(_ sender: Any) {
        iimageIMG.image = UIImage(named: "Rose")
    }
    
    @IBAction func btnStartPressed(_ sender: Any) {
        if usernameTXTF.text != "" {
            self.performSegue(withIdentifier: "goToSecondPage", sender: nil)
        }else{
            let alert = UIAlertController(title: "Message", message: "sasir un nom !", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondPage" {
            if let vc = segue.destination as? GameRoomViewController {
                vc.username = usernameTXTF.text
            }
        }
    }
    
}

