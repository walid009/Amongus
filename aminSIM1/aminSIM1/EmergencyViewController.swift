//
//  EmergencyViewController.swift
//  aminSIM1
//
//  Created by chekir walid on 2/1/2023.
//

import UIKit
import CoreData

class EmergencyViewController: UIViewController, UICollectionViewDataSource {
    
    var names = [String]()
    var colors = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        retreiveData()
        // Do any additional setup after loading the view.
    }
    
    //functions
    func retreiveData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Amongus")
        
        do {
            
            let data = try managedContext.fetch(request)
            for item in data {
                
                names.append(item.value(forKey: "name") as! String)
                colors.append(item.value(forKey: "color") as! String)
            }
            
        } catch  {
            
            print("Fetching error !")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let contentView = cell.contentView
        
        let image = contentView.viewWithTag(1) as! UIImageView
        let label1 = contentView.viewWithTag(2) as! UILabel
        
        image.image = UIImage(named: colors[indexPath.row])
        label1.text = names[indexPath.row]
        
        return cell
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
