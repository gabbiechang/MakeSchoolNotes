//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    


    var notes = [Note]() {
        didSet {
            tableView.reloadData()
            print(count)
        }
    }
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        // 2
        let note = notes[indexPath.row]
        cell.noteTitle.text = note.title
        // 3
        cell.lastModifiedLabel.text = note.modificationTime.convertToString()
        
        return cell
    }



    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayNote":
            //1
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            //2
            let note = notes[indexPath.row]
            
            //3
            let destination = segue.destination as! DisplayNoteViewController
            
            //4
            destination.note = note
            
        case "addNote":
            print("create note bar button item tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
        }
    }
    
    
}

