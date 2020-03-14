//
//  Helpers.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-14.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import Foundation

func isNoteLocked(_ lockStatus: LockStatus) -> Bool {
    if lockStatus == .locked {
        return true
    } else {
        return false
    }
        
}

func lockStatusFlipper(_ lockStatus: LockStatus) -> LockStatus {
    if lockStatus == .locked {
        return .unlocked
    } else {
        return .locked
    }
}
