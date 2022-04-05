//
//  ViewController.swift
//  WeiLi Project
//
//  Created by Barry on 2022-03-31.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var inputName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder();
    }
    
    
    @IBAction func backgroundTap(_ sender: UITapGestureRecognizer) {
        inputName.resignFirstResponder();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let passName = inputName.text ?? "";
        let pts = 500;
        let playVC = segue.destination as? PlayViewController;
        playVC?.passName = passName;
        playVC?.pts = pts;
    }
}

