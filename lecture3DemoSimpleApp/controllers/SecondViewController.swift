//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func removeItem(_ id: Int)
    func editItem(_ id: Int)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    let cellId = "TableViewCell"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        testDataConfigure()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
    }

    
    func testDataConfigure(){
        
    }
    
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        //change this method
        //Alert manager with two fields
        tableView.reloadData()
    }
    
}

extension SecondViewController: SecondViewControllerDelegate{
    func removeItem(_ id: Int) {
        //remove item from array
    }
    
    func editItem(_ id: Int) {
        //open new view controller which allows you to change the data of the array item
    }
 
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
        cell.cellConfigure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: (Bool) -> ()) in actionPerformed(true)

                self.removeItem(indexPath.row)

                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

            }

            delete.backgroundColor = .systemRed

            return UISwipeActionsConfiguration(actions: [delete])

        }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool) -> ()) in actionPerformed(true)

                let vc = self.storyboard?.instantiateViewController(identifier: "EditToDoItemViewController") as! EditToDoItemViewController

                vc.delegate  = self

                vc.index = indexPath.row

                vc.editingItem = self.arr[indexPath.row]

                self.navigationController?.pushViewController(vc, animated: true)

            }

            edit.backgroundColor = .systemOrange
         return UISwipeActionsConfiguration(actions: [edit])

        }
    
    
    
}
