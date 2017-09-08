//
//  NoteModel.swift
//  SecretWriter
//
//  Created by Shirley Qin on 2017-09-06.
//  Copyright © 2017 Shirley Qin. All rights reserved.
//

import UIKit

class NoteModel: NSObject {
    var date: String?
    var title: String?
    var body: String?
    var tags: Array<String>?
    var locked = false
    var stared = false
    
    var id: Int?
}
