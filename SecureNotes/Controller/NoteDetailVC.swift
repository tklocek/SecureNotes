//
//  NoteDetailVC.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-11.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class NoteDetailVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var noteTextView: UITextView!
    
    //Variables
    var note : Note!
    var index: Int!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        noteTextView.text = note.message
        
        
    }
    
    @IBAction func lockNoteBtnWasPressed(_ sender: Any) {
        notesArray[index].lockStatus = lockStatusFlipper(note.lockStatus)
        navigationController?.popViewController(animated: true)
        
    
    }
    
}
