//
//  ViewController.swift
//  Hello
//
//  Created by mrtMacBook on 2023/04/08.
//

import UIKit

// Note class to represent a note
class Note {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

// ViewController for the main screen
class ViewController: UIViewController {
//  @IBAction, @IBOutlet : StoryBoard와의 연결고리를 담당
//  IBAction은 Event가 일어난 경우 호출되는 Action을 정의해둔 것이고, IBOutlet은 값에 접근하기위한 변수라고 생각
    @IBOutlet weak var tableView: UITableView!

    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // Function to create a new note
    @IBAction func createNoteButtonPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Note", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Content"
        }
        
        let createAction = UIAlertAction(title: "Create", style: .default) { (_) in
            if let titleTextField = alertController.textFields?.first,
               let contentTextField = alertController.textFields?.last {
                let note = Note(title: titleTextField.text ?? "", content: contentTextField.text ?? "")
                self.notes.append(note)
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(createAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

// UITableViewDataSource and UITableViewDelegate implementation
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

