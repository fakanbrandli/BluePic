//
//  Created by Fakan Brandli on 24/09/16.
//  Copyright (c) 2016. Fakan Brandli All rights reserved.
//
import UIKit

class ImagesCurrentlyUploadingImageFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!

    @IBOutlet weak var captionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    /**
     Method that sets up the data for this cell

     - parameter image:   UIImage?
     - parameter caption: String?
     */
    func setupData(_ image: UIImage?, caption: String?) {

        if let img = image {
            userImageView.image = img
        }

        //set the captionLabel's text
        var cap = caption ?? ""
        if cap == CameraDataManager.SharedInstance.kEmptyCaptionPlaceHolder {
            cap = ""
        }
        captionLabel.text = cap

    }
}
