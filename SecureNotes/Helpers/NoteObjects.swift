//
//  NoteObjects.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-11.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import Foundation

var note1 = Note(message: "Devslopes is a really amazing platform to learn to code. Check it out at devslopes.com", lockStatus: .locked)
var note2 = Note(message: "I love learning about Touch ID and FaceID at the same time. Thanks, Apple, for making such amazing framework.", lockStatus: .unlocked)
var note3 = Note(message: "Allright stop. Collaborate and listen. Devslopes back with a brand new invention.", lockStatus: .locked)
var notesArray: [Note] = [note1, note2, note3]
