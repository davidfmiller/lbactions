#!/usr/bin/env swift

// LaunchBar Action Script

import Foundation
import Cocoa

let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])

let PATH = "../Resources/ReplaceTextDefault.plist"

let dict : NSDictionary! = NSDictionary(contentsOfFile:PATH)

for arg in arguments
{
    let value = dict[arg.trimmingCharacters(in: CharacterSet.whitespaces)] as? String
    if value != nil
    {
        print(value!)
    }
    else
    {
        print(arg)
    }
}
