//
//  NoteCell.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-11.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var lockImageView: UIImageView!

    func configureCell(note: Note) {
        if note.lockStatus == .locked {
            lockImageView.isHidden = false
            messageLbl.text = "This note is locked. Unlock to read."
        } else {
            lockImageView.isHidden = true
            messageLbl.text = note.message
        }
    }
    
}
