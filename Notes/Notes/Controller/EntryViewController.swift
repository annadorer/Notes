//
//  EntryViewController.swift
//  Notes
//
//  Created by Anna on 12.02.2023.
//

import UIKit

class EntryViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    public var edit: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButton))
        titleField.text = note?.title
        noteField.text = note?.text
    }
    
    @objc func saveButton() {
        if note == nil {
            if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
                completion?(text, noteField.text)
            }
        }
        else {
            if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
                edit?(text, noteField.text)
            }
        }
    }
}
