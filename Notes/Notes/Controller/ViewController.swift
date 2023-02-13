//
//  ViewController.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func navigate(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "Entry") as? EntryViewController else {
                    return
        }
        vc.title = "Заметки"
        vc.completion = { title, text in
            addNote(titleNote: title, nameNote: text)
            self.tableView.reloadData()
            self.navigationController?.popToRootViewController(animated: true)
        }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //Table
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIndentifier", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].text
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "Entry") as? EntryViewController else {
                    return
        }
        vc.note = notes[indexPath.row]
        vc.edit = { title, text in
            removeNote(at: indexPath.row)
            addNote(titleNote: title, nameNote: text)
            self.tableView.reloadData()
            self.navigationController?.popToRootViewController(animated: true)
        }
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeNote(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNote()
    }
}

