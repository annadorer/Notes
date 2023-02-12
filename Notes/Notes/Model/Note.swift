//
//  Note.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import Foundation

struct Note: Codable {
    var title: String
    var text: String = ""
    var noteID: Int
    //var data: NSData
    init(title: String, text: String, noteID: Int) {
        self.title = title
        self.text = text
        self.noteID = noteID
        //self.data = NSData()
    }
}

struct NoteArray: Codable {
    var notes: [Note] = Array()
}
