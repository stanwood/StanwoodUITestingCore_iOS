//
//  UITestingCoreItem.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
import Foundation

/// UITestingCoreItems contains a collection of tracked versions
public struct UITestingCoreItems: Codable {
    
    /// Current tracked versions
    var versions: [UITestingCoreVersion]
    
    /// :nodoc:
    public init(versions: [UITestingCoreVersion]) {
        self.versions = versions
    }
    
    /// Payload dictionary
    public func payload() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return nil
        }
        return dictionary
    }
    
    /**
     Appends a new versios  item
     
     - Parameters:
        - version: `UITestingCoreVersion` version
     
     - SeeAlso: UITestingCoreVersion
     */
    mutating public func append(_ version: UITestingCoreVersion) {
        if versions.contains(version), let index = index(for: version) {
            versions[index] = version
        } else {
            versions.append(version)
        }
    }
    
    /**
     Returns the index of a version item
     
     - Parameters:
        - version: `UITestingCoreVersion` version
     
     - Returns: version index
     
     - SeeAlso: UITestingCoreVersion
     */
    func index(for version: UITestingCoreVersion) -> Int? {
        return versions.index(of: version)
    }
}
