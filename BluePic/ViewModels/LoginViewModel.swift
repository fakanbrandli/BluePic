//
//  Created by Fakan Brandli on 24/09/16.
//  Copyright (c) 2016. Fakan Brandli All rights reserved.
//

import UIKit

enum LoginViewModelNotification {
    case loginSuccess
    case loginFailure
    case userCanceledLogin
}

class LoginViewModel: NSObject {

    var notifyLoginVC : ((_ loginViewModelNotification: LoginViewModelNotification) -> ())!

    /**
     Method sets up the callback method to notify the login vc of login view model notifications

     - parameter notifyLoginVC: ((loginViewModelNotification : LoginViewModelNotification) -> ())

     - returns: LoginViewModel
     */
    init(notifyLoginVC: @escaping (_ loginViewModelNotification: LoginViewModelNotification) -> ()) {
        super.init()

        self.notifyLoginVC = notifyLoginVC

    }

    /**
     Method informs the LoginDataManager that the user decided to login later
     */
    func loginLater() {
        LoginDataManager.SharedInstance.loginLater()
    }

    /**
     Method tells the LoginDataManager to begin the login process. We will eventually receieve the result of the login and we we handle errors or success by notifying the login vc appropriately.
     */
    func authenticateWithFacebook() {

        LoginDataManager.SharedInstance.login({ error in

            if error == nil {
                self.notifyLoginVC(LoginViewModelNotification.loginSuccess)
            } else if error == LoginDataManagerError.userCanceledLogin {
                self.notifyLoginVC(LoginViewModelNotification.userCanceledLogin)
            } else {
                self.notifyLoginVC(LoginViewModelNotification.loginFailure)
            }

        })
    }

}
