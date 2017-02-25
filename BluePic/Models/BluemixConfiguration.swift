//
//  Created by Fakan Brandli on 24/09/16.
//  Copyright (c) 2016. Fakan Brandli All rights reserved.
//

import UIKit

class BluemixConfiguration: NSObject {

    //Plist Keys
    fileprivate let kBluemixKeysPlistName = "bluemix"
    fileprivate let kIsLocalKey = "isLocal"
    fileprivate let kAppRouteLocal = "appRouteLocal"
    fileprivate let kAppRouteRemote = "appRouteRemote"
    fileprivate let kBluemixAppRegionKey = "bluemixAppRegion"
    fileprivate let kBluemixPushAppGUIDKey = "pushAppGUID"
    fileprivate let kBluemixPushAppClientSecret = "pushClientSecret"
    fileprivate let kBluemixMCATenantIdKey = "mcaTenantId"

    let localBaseRequestURL: String
    let remoteBaseRequestURL: String
    let appRegion: String
    var pushAppGUID: String = ""
    var pushClientSecret: String = ""
    var mcaTenantId: String = ""
    var isLocal: Bool = true

    var isPushConfigured: Bool {
        return pushAppGUID != "" && pushClientSecret != ""
    }

    override init() {

        if var localBaseRequestURL = Utils.getStringValueWithKeyFromPlist(kBluemixKeysPlistName, key: kAppRouteLocal),
                var remoteBaseRequestURL = Utils.getStringValueWithKeyFromPlist(kBluemixKeysPlistName, key: kAppRouteRemote),
                let appRegion = Utils.getStringValueWithKeyFromPlist(kBluemixKeysPlistName, key: kBluemixAppRegionKey),
                let isLocal = Utils.getBoolValueWithKeyFromPlist(kBluemixKeysPlistName, key: kIsLocalKey) {
            self.appRegion = appRegion
            self.isLocal = isLocal
            if let lastChar = localBaseRequestURL.characters.last, lastChar == "/" as Character {
                localBaseRequestURL.remove(at: localBaseRequestURL.characters.index(before: localBaseRequestURL.endIndex))
            }
            if let lastChar = remoteBaseRequestURL.characters.last, lastChar == "/" as Character {
                remoteBaseRequestURL.remove(at: remoteBaseRequestURL.characters.index(before: remoteBaseRequestURL.endIndex))
            }
            self.localBaseRequestURL = localBaseRequestURL
            self.remoteBaseRequestURL = remoteBaseRequestURL

            // if present, add push app GUID and push client secret
            if let pushAppGUID = Utils.getStringValueWithKeyFromPlist(kBluemixKeysPlistName, key: kBluemixPushAppGUIDKey) {
                self.pushAppGUID = pushAppGUID
            }

            if let pushClientSecret = Utils.getStringValueWithKeyFromPlist(kBluemixKeysPlistName, key: kBluemixPushAppClientSecret) {
                self.pushClientSecret = pushClientSecret
            }

            if let mcaTenantId = Utils.getStringValueWithKeyFromPlist(kBluemixKeysPlistName, key: kBluemixMCATenantIdKey) {
                self.mcaTenantId = mcaTenantId
            }

            super.init()
        } else {
            fatalError("Could not load bluemix plist into object properties")
        }
    }

}
