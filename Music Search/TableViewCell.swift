//
//  TableViewCell.swift
//  Music Search
//
//  Created by John D. Jackson on 9/22/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTerms: UILabel!
    @IBOutlet weak var lblsubject: UILabel!
    @IBOutlet weak var lblcatalogNbr: UILabel!
    @IBOutlet weak var lblcourseDescription: UILabel!
    @IBOutlet weak var lblinstructorLast: UILabel!
    @IBOutlet weak var lblinstructorFirst: UILabel!
    @IBOutlet weak var lblaCount: UILabel!
    @IBOutlet weak var lblbCount: UILabel!
    @IBOutlet weak var lblcCount: UILabel!
    @IBOutlet weak var lbldCount: UILabel!
    @IBOutlet weak var lblfCount: UILabel!
    @IBOutlet weak var lblsatisfactory: UILabel!
    @IBOutlet weak var lbldropCount: UILabel!
    @IBOutlet weak var lblpercentA: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
