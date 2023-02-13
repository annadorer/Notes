//
//  NoteDAL.swift
//  Notes
//
//  Created by Anna on 13.02.2023.
//

import Foundation

var notes: [Note] {
    set {
        if let encoded = try? JSONEncoder().encode(newValue) {
            UserDefaults.standard.set(encoded, forKey: "DataKe")
            UserDefaults.standard.synchronize()
        }
    }
    get {
        if let array = UserDefaults.standard.data(forKey: "DataKe") {
            return try! JSONDecoder().decode([Note].self, from: array)
        } else {
            return []
        }
    }
}
var counterID: Int = 2


public func addNote(titleNote: String, nameNote: String) {
    notes.append(Note(title: titleNote, text: nameNote, noteID: counterID))
    counterID+=1
}

public func removeNote(at index: Int) {
    notes.remove(at: index)
}

public func firstNote() {
    if notes.count == 0 {
        let firstNote = Note(title: "Покупки", text: "Не забыть купить молоко!", noteID: 1)
        notes.append(firstNote)
    }
}
