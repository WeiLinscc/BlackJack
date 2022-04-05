//
//  PlayViewController.swift
//  WeiLi Project
//
//  Created by Barry on 2022-03-31.
//

import UIKit

class PlayViewController: UIViewController {
    
  
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var ptsLbl: UILabel!
    @IBOutlet weak var youLbl: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var hitBtn: UIButton!
    @IBOutlet weak var stayBtn: UIButton!
    
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
//    var houseCount = 0
    var getCardCount = 0;
    var iniX = 100;
    var cardViews: [UIImageView] = []

    var addImgY = 460
    var who_score = 0
    var youBusted = false
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
        welcomeLbl.text = "Welcome, " + passName;
        ptsLbl.text = "Your Score: " + String(pts) + "pts";
                
        youLbl.text = passName;
        if (youLbl.text == ""){
            youLbl.text = "You";
            welcomeLbl.text = "Welcome, Friend";
        }
        houseCard1.image = UIImage(named: "backHouse.png");
        houseCard2.image = UIImage(named: "backHouse.png");
        youCard1.image = UIImage(named: "backYou.png")
        youCard2.image = UIImage(named: "backYou.png")
 
        getCardCount = 0
        iniX = 100
        youBusted = false
    }

    @IBAction func playBtnPressed(_ sender: UIButton) {
        playBtn.isHidden = true
        hitBtn.isHidden = false
        stayBtn.isHidden = false
        
        card_name_list = Array(playCards.keys)
        card_name_list.shuffle()
        houseCard1.image = UIImage(named: "\(card_name_list[0]).png")
        houseCard2.image = UIImage(named: "\(card_name_list[1]).png")
        youCard1.image = UIImage(named: "\(card_name_list[2]).png")
        youCard2.image = UIImage(named: "\(card_name_list[3]).png")
        
        house_score = Int(playCards["\(card_name_list[0])"]!) + Int(playCards["\(card_name_list[1])"]!)
        
        you_score = Int(playCards["\(card_name_list[2])"]!) + Int(playCards["\(card_name_list[3])"]!)
        print("Your Score = \(you_score)")
        print("house_score = \(house_score)\n")
        
        
    }
    
    @IBAction func hitBtnPressed(_ sender: UIButton) {
       
        addCards(isYou: true)
        you_score = who_score
        print("you_score = \(you_score)")
        print("house_score = \(house_score)\n")
        
        if you_score > 21 {
            youBusted = true
            displayResult(isWin: false)

            hitBtn.isHidden = true
            stayBtn.isHidden = true
            playBtn.isHidden = false
            
        }
        
    }
    
    @IBAction func stayBtnPressed(_ sender: UIButton) {
        getCardCount = 0
        iniX = 100
        
        if house_score >= you_score {
            displayResult(isWin: false)
            
            hitBtn.isHidden = true
            stayBtn.isHidden = true
            playBtn.isHidden = false
        }
        
        while house_score < you_score {
            addCards(isYou: false)
            house_score = who_score
            
            if house_score > 21 {
                displayResult(isWin: true)
                
                hitBtn.isHidden = true
                stayBtn.isHidden = true
                playBtn.isHidden = false
                return
            }
        }
        
        displayResult(isWin: false)
        
        hitBtn.isHidden = true
        stayBtn.isHidden = true
        playBtn.isHidden = false
            
    }
    
    func addCards(isYou: Bool){
        who_score = 0
        if isYou{
            who_score = you_score
            addImgY = 460
        } else {
            who_score = house_score
            addImgY = 226
        }
        
        let cardView = UIImageView()
        cardViews.append(cardView)
        cardViews[getCardCount].frame = CGRect(x: iniX + 40, y: addImgY, width: 104, height: 145)
        cardViews[getCardCount].image = UIImage(named: "\(card_name_list[0]).png")
        view.addSubview(cardViews[getCardCount])
        
        iniX += 40
        who_score += Int(playCards["\(card_name_list[0])"]!)
        card_name_list.remove(at: 0)
        getCardCount += 1
    }
    
    func displayResult(isWin: Bool){
        if isWin {
            let winController = UIAlertController(title: "Congratulations!", message: "You Win!", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                self.pts += 50
                self.viewDidLoad()
                for i in self.cardViews {
                    i.removeFromSuperview()
                }
                
            })

            winController.addAction(dismissAction)
            self.present(winController, animated: true, completion: nil)
        }else {
            if youBusted {
                let loseController = UIAlertController(title: "Lose!", message: "You Busted!", preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                    self.pts -= 50
                    self.viewDidLoad()
                    for i in self.cardViews {
                        i.removeFromSuperview()
                    }
                    
                })

                loseController.addAction(dismissAction)
                self.present(loseController, animated: true, completion: nil)
            } else {
                let loseController = UIAlertController(title: "Sorry", message: "You Lose!", preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                    self.pts -= 50
                    self.viewDidLoad()
                    for i in self.cardViews {
                        i.removeFromSuperview()
                    }
                })

                loseController.addAction(dismissAction)
                self.present(loseController, animated: true, completion: nil)
            }
        }
    }
    


}
