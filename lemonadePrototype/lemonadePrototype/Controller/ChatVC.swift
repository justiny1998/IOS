//
//  ChatVC.swift
//  lemonadePrototype
//
//  Created by Justin Young on 7/30/18.
//  Copyright © 2018 Justin Young. All rights reserved.
//

import UIKit
import QuartzCore

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    //outlets
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextBox: UITextField!
    var messageArray = [Message]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 70
//        print(tableView.rowHeight)
//        if tableView.rowHeight < 70 {
//            tableView.rowHeight = 70
//        }
        messageTextBox.layer.cornerRadius = 10;
        messageTextBox.clipsToBounds = true;
        messageTextBox.borderStyle = UITextBorderStyle.none
        messageTextBox.layer.borderWidth = 1
        messageTextBox.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        

        // Do any additional setup after loading the view.
    }
    
    //counter to determine wether the it is the users "turn" to speak
   
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        
        var speaker = Message(profileImage: #imageLiteral(resourceName: "profileDefault"), message: "")
        if count%2==0 {
            speaker.profileImage = #imageLiteral(resourceName: "reid")
        } else {
            speaker.profileImage = #imageLiteral(resourceName: "justin")
        }
        speaker.message = self.messageTextBox.text
        messageArray.append(speaker)
        self.messageTextBox.text = ""
        self.messageTextBox.resignFirstResponder()
        count += 1
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //if indexPath.section == SECTION_INDEX {
        //    return 70
        //} else {
            return UITableViewAutomaticDimension
        //}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell {
            let message = messageArray[indexPath.row]
            cell.configureCell(message: message)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    /*
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if let messageText = messageArray[indexPath.item].message {
            let size = CGSizeMake(view.frame.width,1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(messageText).boundingRectWithSize(size,options: options, attributes: [NSFontAttributeName: UIFont.systemFontSize(18)],context: nil)
            return CGSizeMake(view.frame.width, estimatedFrame.height + 20)
        }
        
        return CGSizeMake(view.frame.width,100)
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    
}
