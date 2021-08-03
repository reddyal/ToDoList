//
//  AddToDoViewController.swift
//  ToDoList
//
//  Created by Aleena Reddy on 8/2/21.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    var previousToDoTVC = TableViewController()
    
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var switchInput: UISwitch!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
@IBAction func addButtonTapped(_ sender: UIButton) {
        let newToDo = ToDoClass()
        
    if let checkForInput = descriptionInput.text {
        newToDo.description = checkForInput
        newToDo.important = switchInput.isOn
    }
    
    previousToDoTVC.listOfToDo.append(newToDo)
    previousToDoTVC.tableView.reloadData()
    navigationController?.popViewController(animated:true)
}

        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    


}
    
    
