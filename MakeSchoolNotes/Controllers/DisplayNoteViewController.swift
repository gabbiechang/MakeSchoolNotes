//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //understand this function????????
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        guard let note = note else {return }
//        titleTextField.text = note.title
//        contentTextView.text = note.content
        
        //1
        if let note = note {
            //2
            titleTextField.text = note.title
            contentTextView.text = note.content
        } else {
            //3
            titleTextField.text = ""
            contentTextView.text = ""
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        //1 declaring segue identifier and destination
        guard let identifier = segue.identifier,
            let destination = segue.destination as? ListNotesTableViewController
            else {return}
        
        switch identifier {
            //2 editing existing note
        case "save" where note != nil:
            note?.title = titleTextField.text ?? ""
            note?.content = contentTextView.text ?? ""
        
        // 3 creating new note
        case "save" where note == nil:
            let note = Note()
            note.title = titleTextField.text ?? ""
            note.content = contentTextView.text ?? ""
            note.modificationTime = Date()
            
            
            //4 saving
            destination.notes.append(note)
           
           
            
        case "cancel":
            print("cancel bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
}
