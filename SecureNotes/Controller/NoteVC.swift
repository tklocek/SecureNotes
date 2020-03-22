//
//  NoteVC.swift
//  SecureNotes
//
//  Created by Tomek Klocek on 2020-03-10.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import LocalAuthentication


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
        if notesArray[indexPath.row].lockStatus == .locked {
            authenticateBiometrics { (authenticated) in
                if authenticated {
                    let lockStatus = notesArray[indexPath.row].lockStatus
                    notesArray[indexPath.row].lockStatus = lockStatusFlipper(lockStatus)
                    DispatchQueue.main.async {
                        self.pushNoteFor(indexPath: indexPath)
                    }
                }
            }
        } else {
            pushNoteFor(indexPath: indexPath)
        }
        
    }
    
    func pushNoteFor(indexPath: IndexPath) {
        guard let noteDetailVC = storyboard?.instantiateViewController(identifier:  "NoteDetailVC") as? NoteDetailVC else { return }
        noteDetailVC.note = notesArray[indexPath.row]
        noteDetailVC.index = indexPath.row
        navigationController?.pushViewController(noteDetailVC, animated: true)
        
    }
    
    func authenticateBiometrics(completion: @escaping (Bool) -> Void) {
        let myContex = LAContext()
        let myLocalizedReasonString = "Our app uses Touch ID / Face ID to secure your notes."
        var authError : NSError?
        
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContex.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
                myContex.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { (success, evaluateError) in
                    if success {
                        // User authenticated successfully, take appropriate action
                        completion(true)
                    } else {
                         // User did not authenticate successfully, look at error and take appropriate action
                        guard let evaluateErrorString = evaluateError?.localizedDescription else { return }
                        
                        DispatchQueue.main.async {
                            self.showAlert(withMessage: evaluateErrorString)
                        }
                        completion(false)
                    }
                }
            } else {
                // Could not evaluate policy; look at authError and present an appropriate message to user
                guard let authErrorString = authError?.localizedDescription else { return }
                self.showAlert(withMessage: authErrorString)
                completion(false)
            }
        } else {
            // Fallback on earlier versions
            completion(false)
        }
        
        
        
    }
    
    func showAlert(withMessage message: String) {
        let alertVC = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertVC.addAction(action)
        present(alertVC, animated: true, completion: nil)
    }
    
}

