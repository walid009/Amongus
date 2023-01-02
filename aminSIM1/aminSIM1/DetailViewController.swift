//
//  DetailViewController.swift
//  aminSIM1
//
//  Created by chekir walid on 2/1/2023.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var imageColors: String?
    var name: String?
    
    @IBOutlet weak var imageIMG: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = name!
        imageIMG.image = UIImage(named: imageColors!)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func suspectBTNPressed(_ sender: Any) {
        if checkPlayer() {
            let alert = UIAlertController(title: "Message", message: "Player already exist !", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }else{
            addPlayer()
            let alert = UIAlertController(title: "Message", message: "Player added successfully !", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func addPlayer() {
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2 ORM
        let persistentContainer = appDelegate.persistentContainer
        //3 COPY
        let managedContext = persistentContainer.viewContext
        
        //4 NSEntityDescription
        let entityDescription = NSEntityDescription.entity(forEntityName: "Amongus", in: managedContext)
        //5 NSManagedObject
        let object = NSManagedObject(entity: entityDescription!, insertInto: managedContext)
            
        //6 nseti les donnees
        object.setValue(imageColors!, forKey: "color")
        object.setValue(name!, forKey: "name")
       
        //save a travers managedContext.save()
        do {
                try managedContext.save()
            } catch {
                    let nserror = error as NSError
                    print("Unresolved error, \(nserror), \(nserror.userInfo)")
            }
        
        }
    
    func checkPlayer() -> Bool {
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //2 ORM
        let persistentContainer = appDelegate.persistentContainer
        //3 COPY
        let managedContext = persistentContainer.viewContext
        
            let request = NSFetchRequest<NSManagedObject>(entityName: "Amongus")
            request.predicate = NSPredicate(format: "name like %@", name!)
            do{
                let result = try managedContext.fetch(request)
                if result.count > 0 {
                    return true
                }
            }catch{
                    print("error fetch")
                    return false
            }
            return false
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
