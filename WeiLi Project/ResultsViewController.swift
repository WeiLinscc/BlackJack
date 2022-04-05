//
//  ResultsViewController.swift
//  WeiLi Project
//
//  Created by Barry on 2022-04-05.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var createsArr: [Int] = [];
    @IBOutlet weak var resultsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return createsArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        
        let title = cell.viewWithTag(1) as! UILabel;
        let creates = cell.viewWithTag(2) as! UILabel;
        title.text = String("Round \(indexPath.row + 1)");
        creates.text = String(createsArr[indexPath.row]);
        return cell
    }
}
