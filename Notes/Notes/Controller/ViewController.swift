//
//  ViewController.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import UIKit

var text: [Note] = [Note(text: "Купить цветы", noteID: 1), Note(text: "Не забыть сделать задание", noteID: 2)]
var counterID: Int = 3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBAction func addButton(_ sender: Any) {
        addNote(nameNote: "New Note")
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndentifier", for: indexPath)
        cell.textLabel?.text = text[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeNote(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func addNote(nameNote: String) {
        text.append(Note(text: nameNote, noteID: counterID))
        counterID+=1
    }
    
    func removeNote(at index: Int) {
        text.remove(at: index)
    }
    
    
}

