//
//  FriendsContollerHelper.swift
//  messengerClone
//
//  Created by Justin Young on 7/25/18.
//  Copyright © 2018 Justin Young. All rights reserved.
//

import UIKit

class Friend: NSObject {
    
    var name: String?
    var profileImageName: String?
    
}
class Message: NSObject {
    var text: String?
    var date: NSDate?
    
    var friend: Friend?
    
}

extension FriendsController {
    func setupData(){
        let reid = Friend()
        reid.name = "Reid Lappin"
        reid.profileImageName = "reidLappin"
        
        let message = Message()
        message.friend = reid
        message.text = "Hello, my name is Reid and I am the CEO of Vokal Interactive"
        message.date = NSDate()
        
        let justin = Friend()
        justin.name = "Justin Young"
        justin.profileImageName = "justinYoung"
        
        let messageJustin = Message()
        messageJustin.friend = justin
        messageJustin.text = "Hopefully this helps me develop the chat UI soon"
        messageJustin.date = NSDate()
        
        messages = [message, messageJustin]
    }
}
