//
//  Note.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import Foundation

struct Note {
    var text: String = ""
    var noteID: Int
    var data: NSData
    init(text: String, noteID: Int) {
        self.text = text
        self.noteID = noteID
        self.data = NSData()
    }
}
