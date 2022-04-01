//
//  PlayViewController.swift
//  WeiLi Project
//
//  Created by Barry on 2022-03-31.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var nameLbl1: UILabel!
    @IBOutlet weak var ptsLbl: UILabel!
    @IBOutlet weak var nameLbl2: UILabel!
    
    @IBOutlet weak var stayBtn: UIButton!
    @IBOutlet weak var hitBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    
    var passName: String = "";
    var pts: Int = 200;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLbl1.text = "Welcome, " + passName;
        ptsLbl.text = "Your score: " + String(pts) + "pts";
        nameLbl2.text = passName;
    }
    
    @IBAction func playBtnPressed(_ sender: UIButton) {
        playBtn.isHidden = true
        stayBtn.isHidden = false;
        hitBtn.isHidden = false;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
