//
//  NotesViewController.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import UIKit

final class NotesViewController: UIViewController {
    
    private let noteService: NoteServiceProtocol = NoteService()
    
    @IBOutlet private var tableView: UITableView?

    @IBAction func createNote() {
        openNote()
    }
    
    private func openNote(_ note: Note? = nil) {
        guard let vc = storyboard?.instantiateViewController(identifier: "NoteViewController") as? NoteViewController else {
            return
        }
        vc.title = "Заметка"
        vc.note = note
        vc.completion = { [weak self] title, text in
            guard let self = self else {
                return
            }
            if let note = note {
                self.noteService.updateNote(title: title, text: text, id: note.id)
            } else {
                self.noteService.addNote(title: title, text: text)
            }
            self.tableView?.reloadData()
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteService.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndentifier", for: indexPath)
        cell.textLabel?.text = noteService.notes[indexPath.row].title
        cell.detailTextLabel?.text = noteService.notes[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = noteService.notes[indexPath.row]
        openNote(note)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        noteService.removeNote(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}
