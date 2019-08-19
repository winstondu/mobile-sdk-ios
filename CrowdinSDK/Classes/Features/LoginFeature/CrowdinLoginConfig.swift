//
//  CrowdinLoginConfig.swift
//  CrowdinSDK
//
//  Created by Serhii Londar on 8/16/19.
//

import Foundation

public protocol LoginConfig { }

@objcMembers public class CrowdinLoginConfig: NSObject, LoginConfig {
	var clientId: String
	var clientSecret: String
	var scope: String
	var redirectURI: String
	
	public init(clientId: String, clientSecret: String, scope: String, redirectURI: String) {
        guard !clientId.isEmpty else { fatalError("clientId could not be empty.") }
		self.clientId = clientId
        guard !clientSecret.isEmpty else { fatalError("clientSecret could not be empty.") }
		self.clientSecret = clientSecret
        guard !scope.isEmpty else { fatalError("scope could not be empty.") }
		self.scope = scope
        guard !redirectURI.isEmpty else { fatalError("redirectURI could not be empty.") }
        guard let urlSchemes = Bundle.main.urlSchemes, urlSchemes.contains(redirectURI) else { fatalError("Application supported url schemes should contain \(redirectURI)") }
		self.redirectURI = redirectURI
	}
}
