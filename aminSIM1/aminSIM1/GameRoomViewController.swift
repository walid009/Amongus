//
//  GameRoomViewController.swift
//  aminSIM1
//
//  Created by chekir walid on 2/1/2023.
//

import UIKit

class GameRoomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //Class 'GameRoomViewController' has no initializers to solve problem ya t initializeha ="dsqdsq" (non recommender) ou tamel ? maneha bch tsirelha intialisation ba3ed
    var username:String?
    let names=["Hu5tl3r", "MC_Killer", "CR7", "Not_Impostor", "BabyShark", "AKINFENWA", "DR Who"]
    let colors=["Red", "Yellow", "Brown", "Light-blue", "Orange", "Purple", "Rose"]
    
    @IBOutlet weak var userLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //toute variable? lezem ba3ed ki t3ayetlha t unrapeha avec variable!
        userLB.text = "Hello "+username!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contentView = cell.contentView
        
        let image = contentView.viewWithTag(1) as! UIImageView
        let label1 = contentView.viewWithTag(2) as! UILabel
        let label2 = contentView.viewWithTag(3) as! UILabel
        
        image.image = UIImage(named: colors[indexPath.row])
        label1.text = names[indexPath.row]
        label2.text = colors[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            let indexPath = sender as! IndexPath
            if let vc = segue.destination as? DetailViewController{
                vc.imageColors = colors[indexPath.row]
                vc.name = names[indexPath.row]
            }
        }
    }

}
 
