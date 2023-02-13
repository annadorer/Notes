//
//  EntryViewController.swift
//  Notes
//
//  Created by Anna on 12.02.2023.
//

import UIKit

class EntryViewController: UIViewController {
    
    var counterID: Int = 3
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    
    public var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButton))
    }
    @objc func saveButton() {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            completion?(text, noteField.text)
            //notes.append(Note(title: titleField.text!, text: noteField.text, noteID: counterID))
            //counterID+=1
        }
    }
}
