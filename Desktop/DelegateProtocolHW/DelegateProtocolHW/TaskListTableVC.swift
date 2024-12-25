//
//  AddTaskTableViewController.swift
//  DelegateProtocolHW
//
//  Created by Karina Kinzhigaliyeva on 23.12.2024.
//

import UIKit


class TaskListTableVC: UITableViewController, AddNewTaskProtocol {
    
    var tasks: [String] = []
    
    
    @IBAction func plusButton(_ sender: Any) {
        
        let modalView = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        modalView.modalPresentationStyle = .overCurrentContext
        modalView.delegate = self
        present(modalView, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addTask(task: String) {
        tasks.append(task)
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
