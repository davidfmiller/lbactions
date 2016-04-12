#!/usr/bin/env swift

// LaunchBar Action Script

import Foundation
import Cocoa

let arguments = Array(Process.arguments[1 ..< Process.arguments.count])

let PATH = "../Resources/textreplace-default.plist"

let dict : NSDictionary! = NSDictionary(contentsOfFile:PATH)

for arg in arguments
{
    let value = dict.objectForKey(arg) as? String
    if value != nil
    {
        print(value!)
    }
    else
    {
        print("👽")
    }
}
