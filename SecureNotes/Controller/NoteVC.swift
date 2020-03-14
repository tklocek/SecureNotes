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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteCell else { return UITableViewCell() }
        
        let note = notesArray[indexPath.row]
        cell.configureCell(note: note)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushNoteFor(indexPath: indexPath)
        
    }
    
    func pushNoteFor(indexPath: IndexPath) {
        guard let noteDetailVC = storyboard?.instantiateViewController(identifier:  "NoteDetailVC") as? NoteDetailVC else { return }
        noteDetailVC.note = notesArray[indexPath.row]
        noteDetailVC.index = indexPath.row
        navigationController?.pushViewController(noteDetailVC, animated: true)
        
    }
    
}

