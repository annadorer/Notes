//
//  NoteViewController.swift
//  Notes
//
//  Created by Anna on 12.02.2023.
//

import UIKit

final class NoteViewController: UIViewController {
    
    @IBOutlet private var titleField: UITextField?
    @IBOutlet private var noteField: UITextView?
    
    var note: Note?
    
    var completion: ((String, String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButton))
        titleField?.text = note?.title
        noteField?.text = note?.text
    }
    
    @objc private func saveButton() {
        guard let title = titleField?.text, !title.isEmpty else {
            presentRequiredTitleError()
            return
        }
        completion?(title, noteField?.text ?? "")
    }
    
    private func presentRequiredTitleError() {
        let alert = UIAlertController(title: "Заголовок обязателен!", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true)
    }
}
