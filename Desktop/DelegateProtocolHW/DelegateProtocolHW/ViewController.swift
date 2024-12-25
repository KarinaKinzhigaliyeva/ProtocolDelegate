//
//  ViewController.swift
//  DelegateProtocolHW
//
//  Created by Karina Kinzhigaliyeva on 23.12.2024.
//

import UIKit

protocol AddNewTaskProtocol {
    func addTask(task: String)
}


class ViewController: UIViewController {
  
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate:AddNewTaskProtocol?
    
    @IBAction func addTaskButton(_ sender: Any) {
        
        let newtask = textField.text
        delegate?.addTask(task: newtask!)
        dismissView()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.layer.cornerRadius = 17
        
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissView() {
        dismiss(animated: true)
    }

}

