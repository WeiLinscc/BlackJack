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
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var houseCard1: UIImageView!
    @IBOutlet weak var houseCard2: UIImageView!
    @IBOutlet weak var youCard1: UIImageView!
    @IBOutlet weak var youCard2: UIImageView!
    
    var passName: String = "";
    var pts: Int = 200;
    var playCards: [String:Int] = ["spadeA":1, "spade2":2, "spade3":3, "spade4":4, "spade5":5, "spade6":6, "spade7":7, "spade8":8, "spade9":9, "spade10":10, "spadeJ":10, "spadeQ":10, "spadeK":10, "heartA":1, "heart2":2, "heart3":3, "heart4":4, "heart5":5, "heart6":6, "heart7":7, "heart8":8, "heart9":9, "heart10":10, "heartJ":10, "heartQ":10, "heartK":10, "diamondA":1, "diamond2":2, "diamond3":3, "diamond4":4, "diamond5":5, "diamond6":6, "diamond7":7, "diamond8":8, "diamond9":9, "diamond10":10, "diamondJ":10, "diamondQ":10, "diamondK":10, "clubA":1, "club2":2, "club3":3, "club4":4, "club5":5, "club6":6, "club7":7, "club8":8, "club9":9, "club10":10, "clubJ":10, "clubQ":10, "clubK":10];
    var card_name_list:[String] = [];
    var house_score: Int = 0;
    var you_score: Int = 0;
    var houseCount = 0
    var youCount = 0;
    var house_card_list:[String] = [];
    var you_card_list:[String] = [];
    var iniX = 100;
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
        nameLbl1.text = "Welcome, " + passName;
        ptsLbl.text = "Your Score: " + String(pts) + "pts";
                
        nameLbl2.text = passName;
        if (nameLbl2.text == ""){
            nameLbl2.text = "You";
            nameLbl1.text = "Welcome, Friend";
        }
        houseCard1.image = UIImage(named: "backHouse.png");
        houseCard2.image = UIImage(named: "backHouse.png");
        youCard1.image = UIImage(named: "backYou.png")
        youCard2.image = UIImage(named: "backYou.png")
        
        

    }

    @IBAction func playBtnPressed(_ sender: UIButton) {
        card_name_list = Array(playCards.keys)
        houseCard1.image = UIImage(named: "\(card_name_list[0]).png")
        houseCard2.image = UIImage(named: "\(card_name_list[1]).png")
        youCard1.image = UIImage(named: "\(card_name_list[2]).png")
        youCard2.image = UIImage(named: "\(card_name_list[3]).png")
        
//        print(card_name_list[0])
//        print(card_name_list[1])
        house_score = Int(playCards["\(card_name_list[0])"]!) + Int(playCards["\(card_name_list[1])"]!)
        print(house_score)


    }
    
    @IBAction func hitBtnPressed(_ sender: UIButton) {
        addNewCard()
    }
    
    func init2Cards(){
        
        house_card_list = [card_name_list[0], card_name_list[1]];
        you_card_list = [card_name_list[2], card_name_list[3]];
        print("house: \(house_card_list)");
        print("you: \(you_card_list)");
        
        card_name_list.removeFirst(4)
        print("poker_list: \(card_name_list)");
        print("长度为：\(card_name_list.count)")
    }
    
    func addNewCard(){
        let cardView = UIImageView()
        cardView.frame = CGRect(x: iniX + 40, y: 224, width: 104, height: 145)
        
        cardView.image = UIImage(named: "\(card_name_list[houseCount + 4]).png")
        view.addSubview(cardView)
        iniX += 40
        house_score += Int(playCards["\(card_name_list[houseCount + 4])"]!)
        print(house_score)
        houseCount += 1
        
        
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
