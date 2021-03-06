//
//  APIHeaders.swift
//  Core
//
//  Copyright © 2018 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import Alamofire

public class APIHeaders {

    struct Name {
        static let userAgent = "User-Agent"
        static let etag = "ETag"
    }

    private let appVersion: AppVersion

    public init(appVersion: AppVersion = AppVersion()) {
        self.appVersion = appVersion
    }

    public var defaultHeaders: HTTPHeaders {
        let fullVersion = "\(appVersion.versionNumber).\(appVersion.buildNumber)"
        let osVersion = UIDevice.current.systemVersion
        let userAgent = "ddg_ios/\(fullVersion) (\(appVersion.identifier); iOS \(osVersion))"
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        headers[Name.userAgent] = userAgent
        return headers
    }

}
