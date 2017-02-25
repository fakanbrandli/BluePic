//
//  Created by Fakan Brandli on 24/09/16.
//  Copyright (c) 2016. Fakan Brandli All rights reserved.
//

import UIKit

class CurrentUser: NSObject {

    /// Grab facebook user id of user from UserDefaults
    class var facebookUserId: String {
        get {
            if let userId = UserDefaults.standard.object(forKey: "facebook_user_id") as? String {
                return userId
            } else {
                return "anonymous"
            }
        }
        set(userId) {

            UserDefaults.standard.set(userId, forKey: "facebook_user_id")
            UserDefaults.standard.synchronize()
        }
    }

    /// grab full name of user from UserDefaults
    class var fullName: String {
        get {
            if let full_name = UserDefaults.standard.object(forKey: "user_full_name") as? String {
                return full_name
            } else {
                return "Anonymous"
            }
        }
        set(user_full_name) {

            UserDefaults.standard.set(user_full_name, forKey: "user_full_name")
            UserDefaults.standard.synchronize()
        }
    }


    /// generate string for the users facebook profile picture url
    class var facebookProfilePictureURL: String {
        get {

            if CurrentUser.facebookUserId != "anonymous" {
                return kFacebookProfilePictureURLPrefix + facebookUserId + kFacebookProfilePictureURLPostfix
            } else {
                return ""
            }

        }
    }

    /// Grab bool value representing if the user has chosen to login later or not from USerDefaults
    class var willLoginLater: Bool {
        get {
            if let log_in_later = UserDefaults.standard.object(forKey: "log_in_later") as? Bool {
                return log_in_later
            } else {
                return false
            }
        }
        set(log_in_later) {
            UserDefaults.standard.set(log_in_later, forKey: "log_in_later")
            UserDefaults.standard.synchronize()
        }

    }


    /// Prefix for url needed to get user profile picture given their unique id (id goes after this)
    fileprivate static let kFacebookProfilePictureURLPrefix = "http://graph.facebook.com/"

    /// Postfix for url needed to get user profile picture given their unique id (id goes before this)
    fileprivate static let kFacebookProfilePictureURLPostfix = "/picture?type=large"


    /**
     Method resets the CurrentUser to log out
     */
    class func logOut() {

        CurrentUser.facebookUserId = "anonymous"
        CurrentUser.fullName = "Anonymous"

    }

}
