//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class ChatViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages : [Message] = [
        Message(sender: "e", body: "A"),
        Message(sender: "e", body: "b"),
        Message(sender: "e", body: "c"),
        Message(sender: "e", body: "d")
        
        
    ]
    func loadMsgs(){
        
        db.collection(constants.FStore.collectionName).order(by: constants.FStore.dateField).addSnapshotListener{ QuerySnapshot,error  in
            if let e = error {
                print(e)
            }
            self.messages = []
            if let data = QuerySnapshot?.documents{
                for eachdata in data {
                    
                    let docdata = eachdata.data()
                    if   let sender = docdata[constants.FStore.senderField] as? String ,  let msgbody = docdata[constants.FStore.bodyField] as? String {
                        self.messages.append(Message(sender: sender, body: msgbody))
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                        
                    }
                    
                    
                    
                }
            }
            
            
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        tableView.dataSource = self
        tableView.register(MessageCell.nib(), forCellReuseIdentifier: constants.cellIdentifier)
        title = constants.Apptitle
        navigationItem.hidesBackButton = true
        loadMsgs()
        
    }
    
    @IBAction func LogOut(_ sender: UIBarButtonItem) {
        do{
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch{
            print(error)
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text,  let userEmail = Auth.auth().currentUser?.email {
            messageTextfield.endEditing(true)
            messageTextfield.text = ""
            db.collection(constants.FStore.collectionName).addDocument(data:
                                                                        [constants.FStore.senderField: userEmail, constants.FStore.bodyField : messageBody,
                                                                         constants.FStore.dateField : Date().timeIntervalSince1970])
            
            
            
        }
        
        
        
        
        
        
    }
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: constants.cellIdentifier, for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        cell.label.text = message.body

        if(message.sender == Auth.auth().currentUser?.email){
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBuble.backgroundColor = UIColor(named: constants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: constants.BrandColors.purple)
        }
        else{
            
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBuble.backgroundColor = UIColor(named: constants.BrandColors.purple)
            cell.label.textColor = UIColor(named: constants.BrandColors.lightPurple)
        }
                return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  messages.count
    }
    
}
