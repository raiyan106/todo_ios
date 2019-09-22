//
//  File.swift
//  todo_ios
//
//  Created by Raiyan Khan on 22/9/19.
//  Copyright © 2019 Raiyan Khan. All rights reserved.
//

import Foundation

struct Item{
    var title: String
    var isChecked: Bool = false
    
    init(_ title: String) {
        self.title = title
    }
}
