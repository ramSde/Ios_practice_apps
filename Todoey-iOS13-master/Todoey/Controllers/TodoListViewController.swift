import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Todo]() // Array of type Todo
    var textField = UITextField()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = defaults.data(forKey: "todoData") {
            let decoder = JSONDecoder()
            if let items = try? decoder.decode([Todo].self, from: data) {
                itemArray = items
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        let todo = itemArray[indexPath.row]
        cell.textLabel?.text = todo.task
        cell.accessoryType = todo.isDone ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].isDone.toggle()
        tableView.reloadData()
        saveData()
    }
    
    @IBAction func addNewBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todo", message: "", preferredStyle: .alert)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new item"
            self.textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let newItem = self.textField.text, !newItem.isEmpty {
                let todo = Todo(task: newItem, isDone: false)
                self.itemArray.append(todo)
                self.saveData()
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(itemArray) {
            defaults.set(encodedData, forKey: "todoData")
        }
    }
}
