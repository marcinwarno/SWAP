//
//  LinksViewController.swift
//  Swap-design
//
//  Created by Julek on 01/04/2019.
//  Copyright © 2019 Marcin Warno. All rights reserved.
//

import UIKit
import Firebase

class LinksViewController: UIViewController  {

    var instagramProfile = ""
    var databaseHandle : DatabaseHandle!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentUserId = Auth.auth().currentUser?.uid
        
        let databaseReference = Database.database().reference()
        
        databaseHandle = databaseReference.child("user").child(currentUserId!).observe(.value , with: { (snapshot) in
            print("Trying to fetch data from database")
            
            if let userDict = snapshot.value as? [String:Any] {
                
            }
            
        })
        print("kupa")

        let linkCell = UINib(nibName: "LinkTableViewCell", bundle: nil)
        let linkedCell = UINib(nibName: "LinkedTableViewCell", bundle: nil)

        tableView.register(linkCell, forCellReuseIdentifier: "Link Cell")
        tableView.register(linkedCell, forCellReuseIdentifier: "Linked Cell")
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

extension LinksViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "Linked Cell", for: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
