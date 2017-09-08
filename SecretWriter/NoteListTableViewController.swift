//
//  NoteListTableViewController.swift
//  SecretWriter
//
//  Created by Shirley Qin on 2017-09-06.
//  Copyright © 2017 Shirley Qin. All rights reserved.
//

import UIKit

class NoteListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataArray = Array<NoteModel>()
    var titleArray = Array<String>()
    var dateFormatter = DateFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        
        tableView.register(UINib.init(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "NoteCellId")
        
        self.edgesForExtendedLayout = UIRectEdge()
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        for i in 0...5 {
            let model = NoteModel()
            model.title = "myTitle\(i)"
            model.body = "myBody\(i)"
            model.tags = ["mytag1", "mytag2", "mytag3"]
            
            model.date = dateFormatter.string(from: Date())
            dataArray.append(model)
        }
        
        installNavigationItems()
        
    }

    func installNavigationItems() {
        let deleteItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteNote))
        self.navigationItem.rightBarButtonItem = deleteItem
    }
    
    func deleteNote() {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCellId", for: indexPath) as! NoteCell

        let model = dataArray[indexPath.row]
        cell.title.text = model.title
        cell.content.text = model.body
        cell.time.text = model.date

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

   /* public func tableView(_ tableView:UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }*/
    
    private func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        //添加删除按钮
        let deleteRowAction:UITableViewRowAction = UITableViewRowAction(style: .normal, title: "Delete", handler: {
            (action:UITableViewRowAction,index:IndexPath) in
            //先从数据源那里删除数据
            self.dataArray.remove(at: indexPath.row);
            //然后在把tableview上的指定行删除
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        })
        let lock: UITableViewRowAction = UITableViewRowAction(style:.normal, title: "Lock", handler: {
            (action: UITableViewRowAction,index: IndexPath) in
            self.dataArray[indexPath.row].locked = true
        })
        
        let unlock: UITableViewRowAction = UITableViewRowAction(style:.normal, title: "Unlock", handler: {
            (action: UITableViewRowAction,index: IndexPath) in
            self.dataArray[indexPath.row].locked = false
        })
        let actions = [deleteRowAction,lock,unlock];
        return actions;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newNote = self.storyboard?.instantiateViewController(withIdentifier: "editorView")
        self.navigationController?.pushViewController(newNote!, animated: true)
    }
 
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

   /*
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }*/
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
