//
//  ViewController.swift
//  SecretWriter
//
//  Created by Shirley Qin on 2017-09-06.
//  Copyright © 2017 Shirley Qin. All rights reserved.
//

import UIKit

class NoteEditingView: UIViewController {
    
    var model: NoteModel?
    var titleTextField: UITextField?
    var tags: Array<UITextField>?
    var bodyTextView: UITextView?
    
    var tagStr: Array<String>?
    
    var isNew = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.edgesForExtendedLayout = UIRectEdge()
        self.title = "New Note"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        installUI()
        installNavigationItems()
        
        
  
    }

    func installNavigationItems() {
        let itemSave=UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        let itemDelete=UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: nil)
        
        self.navigationItem.rightBarButtonItems = [itemSave, itemDelete]
    }
    
    func installUI() {
        
    }
    
    func keyBoardShow(notification: Notification) {
        let userInfo = notification.userInfo!
        let frameInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as AnyObject
        
        let height = frameInfo.cgRectValue.size.height
    }
    
    func keyBoardHide() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

