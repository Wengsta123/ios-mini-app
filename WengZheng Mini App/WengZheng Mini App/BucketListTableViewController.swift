//
//  BucketListTableViewController.swift
//  WengZheng Mini App
//
//  Created by Zheng, Alicia Ren (arz7cn) on 10/1/18.
//  Copyright © 2018 Jeremy Weng and Alicia Zheng. All rights reserved.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let bucketItemCell = "BucketListTableViewCell"
        static let addItemSegue = "addItem"
        static let editItemSegue = "editItem"
    }
    let item1 = BucketItem(title: "Start the app", latitude: "24", longitude: "42", details: "yeet we did it", date: "2018/10/01")
    let item2 = BucketItem(title: "Complete the milestone", latitude: "177", longitude: "81", details: "it's not that bad", date: "2018/10/03")
    var items: [BucketItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append(item1)
        items.append(item2)
    }

    // MARK: - Table view data source
    
    func resortList() {
        items.sort(by: {$0.complete == $1.complete ? $0.date < $1.date : !$0.complete && $1.complete})
        self.tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.bucketItemCell, for: indexPath) as! BucketListTableViewCell

        let item = items[indexPath.row]
        if (item.complete == true) {
            cell.backgroundColor = .gray
        } else {
            cell.backgroundColor = .white
        }
        cell.update(with: item)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let doneAction = UITableViewRowAction(style: .destructive, title: "Done") { (action, indexpath) in
            self.items[indexPath.row].markComplete()
            self.resortList()
        }
        let editAction = UITableViewRowAction(style: .destructive, title: "Edit") { (action, indexpath) in
            self.performSegue(withIdentifier: PropertyKeys.editItemSegue, sender: indexPath)
        }
        doneAction.backgroundColor = .green
        editAction.backgroundColor = .orange
        return [doneAction,editAction]
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Action
    
    @IBAction func unwindToItemList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ItemViewController, let item = sourceViewController.bucketItem {
            
            if sourceViewController.index == nil {
                let newIndexPath = IndexPath(row: items.count, section: 0)
                items.append(item)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            else{
                if let tempIndex = sourceViewController.index{
                items.remove(at: tempIndex)
                items.insert(item, at: tempIndex)
                }
//                tableView.deselectRow(at: tempIndex, animated: true)
            }
            
            resortList()
//
//
//
//            let newIndexPath = IndexPath(row: items.count, section: 0)
//            items.append(item)
//            tableView.insertRows(at: [newIndexPath], with: .automatic)
//
//            resortList()
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.editItemSegue {
            if let navigationVC = segue.destination as? UINavigationController, let itemViewController = navigationVC.topViewController as? ItemViewController {
                let indexPath = sender as? IndexPath
                itemViewController.bucketItem = items[indexPath!.row]
                itemViewController.index=indexPath!.row
            }
        }
        
    }
    

}
