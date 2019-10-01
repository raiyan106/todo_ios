//
//  File.swift
//  todo_ios
//
//  Created by Raiyan Khan on 22/9/19.
//  Copyright © 2019 Raiyan Khan. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
   @objc dynamic var title: String?
    @objc dynamic var isChecked: Bool = false
    
//     init(_ title: String) {
//        self.title = title
//    }

   
}
