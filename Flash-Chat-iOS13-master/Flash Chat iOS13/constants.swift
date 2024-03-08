//
//  constants.swift
//  Flash Chat iOS13
//
//  Created by Zignuts Tchnolab on 07/03/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation

struct constants {
  static  let registerSegue = "GoRegisterToChat"
   static let loginSegue = "GoLoginToChat"
   static let Apptitle = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }

    
}
