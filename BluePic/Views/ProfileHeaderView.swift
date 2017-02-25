//
//  Created by Fakan Brandli on 24/09/16.
//  Copyright (c) 2016. Fakan Brandli All rights reserved.
//

import UIKit

extension Notification.Name {

    static let showSettingsActionSheet = Notification.Name("ShowSettingsActionSheet")

}

class ProfileHeaderView: UITableViewHeaderFooterView {

    //label displays the name of the user
    @IBOutlet weak var nameLabel: UILabel!

    //label displays the numebr of shots the user has taken
    @IBOutlet weak var numberOfShotsLabel: UILabel!

    //image view displays the user's facebook profile picture
    @IBOutlet weak var profilePictureImageView: UIImageView!

    /**
     Method sets up the data of the profileHeaderView

     - parameter name:              String?
     - parameter numberOfShots:     Int?
     - parameter profilePictureURL: String
     */
    func setupData(_ name: String?, numberOfShots: Int?, profilePictureURL: String) {

        nameLabel.text = name?.uppercased() ?? ""

        if let shots = numberOfShots {

            if shots > 0 {

                var shotsString = ""

                if shots == 1 {
                    shotsString = NSLocalizedString("Shot", comment: "")
                } else {
                    shotsString = NSLocalizedString("Shots", comment: "")
                }

                numberOfShotsLabel.text = "\(shots) \(shotsString)"

            }
        }

        if let url = URL(string: profilePictureURL) {

            profilePictureImageView.sd_setImage(with: url)

        }
    }

    /**
     Method defines the action when the moreButton is pressed. It notifies the rest of the app with the .showSettingsActionSheet notification

     - parameter sender: Any
     */
    @IBAction func moreButtonAction(_ sender: Any) {
        NotificationCenter.default.post(name: .showSettingsActionSheet, object: nil)
    }

}
