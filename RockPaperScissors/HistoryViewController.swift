//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Cao Phuong Nam on 15/08/2022.
//  Copyright © 2022 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellIdentifier = "MatchCell"
    var history: [RPSMatch]!
    
    @IBOutlet weak var tableVieww: UITableView!
    
    override func viewDidLoad() {
        self.tableVieww.delegate = self
        self.tableVieww.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableVieww.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MyCell {
            let match = self.history[(indexPath as NSIndexPath).row]

            cell.fillData(match)

//            var color: UIColor
//            switch match.result {
//            case "Win":
//                color = .init(red: 0, green: 1, blue: 0, alpha: 0.3)
//            case "Tie":
//                color = .init(red: 1, green: 1, blue: 0, alpha: 0.3)
//            default:
//                color = .init(red: 1, green: 0, blue: 0, alpha: 0.3)
//            }
//            cell.backgroundColor = color

            return cell
        } else {
            return MyCell()
        }
    }
    
    func victoryStatusDescription(_ match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
        }
    }
}

class MyCell: UITableViewCell {
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var detailText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(_ match: RPSMatch) {
        self.resultText.text = match.result
        self.detailText.text = "\(match.p1.description) vs \(match.p2.description)"
    }
}
