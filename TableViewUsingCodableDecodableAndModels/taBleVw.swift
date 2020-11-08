//  taBleVw.swift
//  TableViewUsingCodableDecodableAndModels
//  Created by Ranjeet Raushan on 08/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class taBleVw: UITableViewCell {
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_id: UILabel!
    @IBOutlet weak var lbl_userid: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
