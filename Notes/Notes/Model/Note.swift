//
//  Note.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import Foundation

struct Note: Codable {
    var title: String
    var text: String
    var noteID: Int
}

struct NoteArray: Codable {
    var notes: [Note] = Array()
}
