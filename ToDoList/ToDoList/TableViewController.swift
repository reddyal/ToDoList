//
//  TableViewController.swift
//  ToDoList
//
//  Created by Aleena Reddy on 8/2/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listOfToDo : [ToDoCD] = []
    
    /* func createToDo() -> [ToDoClass] {
        
        let swiftToDo = ToDoClass()
        swiftToDo.description = "Learn Swift"
        swiftToDo.important = true
        
        let dogToDo = ToDoClass()
        dogToDo.description = "Walk the Dog"
        
        return [swiftToDo, dogToDo]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

      listOfToDo = createToDo()
        
    }
 */

    func getToDos() {
         if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
              listOfToDo = dataFromCoreData
              tableView.reloadData()
              }
         }
    }



    
    override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfToDo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

    let eachToDo = listOfToDo[indexPath.row]
        
        cell.textLabel?.text = eachToDo.description
        
        if let thereIsDescription = eachToDo.descriptionInCD {
        if eachToDo.importantInCD {
            cell.textLabel?.text = "!" + thereIsDescription
        } else {
            cell.textLabel?.text = thereIsDescription
        }
            return cell
    }
   
        func viewWillAppear(_ animated : Bool) {
            getToDos()
        }

        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as?
            AddToDoViewController {
            nextAddToDoVC.previousToDoTVC = self
        }
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
                  if let choosenToDo = sender as? ToDoClass {
                       nextCompletedToDoVC.selectedToDo = choosenToDo
                       nextCompletedToDoVC.previousToDoTVC = self
                  }
             }
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

             // this gives us a single ToDo
             let eachToDo = listOfToDo[indexPath.row]

             performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
        }

        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }



}
