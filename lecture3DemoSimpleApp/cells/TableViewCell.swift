//
//  TableViewCell.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var delegate: SecondViewControllerDelegate?
    
    var id = 0


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func cellConfigure(with item: ToDoItem) -> Void {
        titleLabel.text=item.title
        subTitleLabel.text=item.subTitle
        if item.status{statusLabel.text="In progress"}
        else{
            statusLabel.text="Done"
        }
        let convertToString = DateFormatter()
        convertToString.dateFormat = "d MMM y"
        dateLabel.text=convertToString.string(from: item.deadLine)
        
    
    }
    
    
}
