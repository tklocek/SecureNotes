//
//  Note.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-11.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import Foundation

class Note {
    public private(set) var message: String
    public var lockStatus: LockStatus
    
    init(message: String, lockStatus: LockStatus) {
        self.message = message
        self.lockStatus = lockStatus
    }
}
