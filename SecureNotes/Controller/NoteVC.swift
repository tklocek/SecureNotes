//
//  NoteVC.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-10.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class NoteVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self        
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

