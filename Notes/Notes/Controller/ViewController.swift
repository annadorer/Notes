//
//  ViewController.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import UIKit

var text: [Note] {
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
var counterID: Int = 3

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func navigate(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "Entry") as? EntryViewController else {
                    return
        
               }
               vc.title = "Заметки"
                navigationController?.pushViewController(vc, animated: true)
    }
    //    @IBOutlet weak var navigate: UIBarButtonItem!
//
//    @IBAction func addButton(_ sender: Any) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "Entry") as? EntryViewController else {
//            return
//
//        }
//        vc.title = "Заметки"
//        navigationController?.pushViewController(vc, animated: true)
//
////        addNote(titleNote: "ewe", nameNote: "New Note")
////        tableView.reloadData()
//    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //Table
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return text.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndentifier", for: indexPath)
        cell.textLabel?.text = text[indexPath.row].text
        cell.detailTextLabel?.text = text[indexPath.row].title
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

    func addNote(titleNote: String, nameNote: String) {
        text.append(Note(title: titleNote, text: nameNote, noteID: counterID))
        counterID+=1
    }
    
    func removeNote(at index: Int) {
        text.remove(at: index)
    }
}

