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
    @IBOutlet weak var exitBtn: UIButton!
    
    
    var passName: String = "";
    var pts: Int = 300;
    var playCards: [String:Int] = ["spadeA":1, "spade2":2, "spade3":3, "spade4":4, "spade5":5, "spade6":6, "spade7":7, "spade8":8, "spade9":9, "spade10":10, "spadeJ":10, "spadeQ":10, "spadeK":10, "heartA":1, "heart2":2, "heart3":3, "heart4":4, "heart5":5, "heart6":6, "heart7":7, "heart8":8, "heart9":9, "heart10":10, "heartJ":10, "heartQ":10, "heartK":10, "diamondA":1, "diamond2":2, "diamond3":3, "diamond4":4, "diamond5":5, "diamond6":6, "diamond7":7, "diamond8":8, "diamond9":9, "diamond10":10, "diamondJ":10, "diamondQ":10, "diamondK":10, "clubA":1, "club2":2, "club3":3, "club4":4, "club5":5, "club6":6, "club7":7, "club8":8, "club9":9, "club10":10, "clubJ":10, "clubQ":10, "clubK":10];
    var card_name_list:[String] = [];
    var house_score: Int = 0;
    var you_score: Int = 0;
//    var houseCount = 0
    var getCardCount = 0;
    var iniX = 100;
    var cardViewsYou: [UIImageView] = []
    var cardViewsHouse:[UIImageView] = []
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
        exitBtn.isHidden = false
    }

    @IBAction func playBtnPressed(_ sender: UIButton) {
        if pts >= 50 {
            playBtn.isHidden = true
            hitBtn.isHidden = false
            stayBtn.isHidden = false
            exitBtn.isHidden = true
            
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
        } else {
            let controller = UIAlertController(title: "Notice!", message: "You don't have  enough pts!", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)

            controller.addAction(dismissAction)
            self.present(controller, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    @IBAction func hitBtnPressed(_ sender: UIButton) {
       
        addCards(isYou: true)
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
    
    @IBAction func exitBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "BackHome", sender: self)

    }
    
    
    func addCards(isYou: Bool){
        if isYou {
            let cardView = UIImageView()
            cardViewsYou.append(cardView)
            cardViewsYou[getCardCount].frame = CGRect(x: iniX + 40, y: 460, width: 104, height: 145)
            cardViewsYou[getCardCount].image = UIImage(named: "\(card_name_list[0]).png")
            view.addSubview(cardViewsYou[getCardCount])
            
            iniX += 40
            you_score += Int(playCards["\(card_name_list[0])"]!)
            card_name_list.remove(at: 0)
            getCardCount += 1
        } else {
            let cardView = UIImageView()
            cardViewsHouse.append(cardView)
            cardViewsHouse[getCardCount].frame = CGRect(x: iniX + 40, y: 226, width: 104, height: 145)
            cardViewsHouse[getCardCount].image = UIImage(named: "\(card_name_list[0]).png")
            view.addSubview(cardViewsHouse[getCardCount])
            
            iniX += 40
            house_score += Int(playCards["\(card_name_list[0])"]!)
            card_name_list.remove(at: 0)
            getCardCount += 1
        }
        
    }
    
    func displayResult(isWin: Bool){
        if isWin {
            let winController = UIAlertController(title: "Congratulations!", message: "You Win!", preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                self.pts += 50
                self.viewDidLoad()
                for i in self.cardViewsYou {
                    i.removeFromSuperview()
                }
                for i in self.cardViewsHouse {
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
                    for i in self.cardViewsYou {
                        i.removeFromSuperview()
                    }
                    for i in self.cardViewsHouse {
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
                    for i in self.cardViewsYou {
                        i.removeFromSuperview()
                    }
                    for i in self.cardViewsHouse {
                        i.removeFromSuperview()
                    }
                })

                loseController.addAction(dismissAction)
                self.present(loseController, animated: true, completion: nil)
            }
        }
    }
    


}
