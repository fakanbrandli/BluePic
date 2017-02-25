//
//  Created by Fakan Brandli on 24/09/16.
//  Copyright (c) 2016. Fakan Brandli All rights reserved.
//

import UIKit

class EmptyFeedFooterView: UITableViewHeaderFooterView {

    //label that informs the user that there are no images in the feed
    @IBOutlet weak var userHasNoImagesLabel: UILabel!

    //message that is shown in the userHasNoImagesLabel
    let kUserHasNoImagesLabelText = NSLocalizedString("Snap a pic or select one from your library!", comment: "message that describes to the user to upload a picture to begin")

}
