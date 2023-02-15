//
//  NoteDAL.swift
//  Notes
//
//  Created by Anna on 13.02.2023.
//

import Foundation

protocol NoteServiceProtocol {
    var notes: [Note] { get }
    func addNote(title: String, text: String)
    func updateNote(title: String, text: String, id: String)
    func removeNote(at index: Int)
    
}

final class NoteService: NoteServiceProtocol {
    
    private enum Constants {
        static let userDefaultsNotesKey = "dwd.Notes.NotesKey"
        static let defaultNotes: [Note] = [Note(title: "Покупки", text: "Не забыть купить молоко!")]
    }
    
    var notes: [Note] {
        set {
            guard let encoded = try? JSONEncoder().encode(newValue) else {
                return
            }
            UserDefaults.standard.set(encoded, forKey: Constants.userDefaultsNotesKey)
            UserDefaults.standard.synchronize()
        }
        
        get {
            guard let data = UserDefaults.standard.data(forKey: Constants.userDefaultsNotesKey),
                  let notes = try? JSONDecoder().decode([Note].self, from: data) else {
                return Constants.defaultNotes
            }
            return notes
        }
    }
    
    func addNote(title: String, text: String) {
        notes.insert(Note(title: title, text: text), at: 0)
    }
    
    func updateNote(title: String, text: String, id: String) {
        notes.removeAll { note in
            note.id == id
        }
        notes.insert(Note(title: title, text: text, id: id), at: 0)
    }

    func removeNote(at index: Int) {
        guard index < notes.count else {
            return
        }
        notes.remove(at: index)
    }
}
