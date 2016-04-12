#!/usr/bin/env swift

import Foundation
import Cocoa

let arguments = Array(Process.arguments[1 ..< Process.arguments.count])

if arguments.count < 1
{
}
else
{
    let PATH = "../Resources/ReplaceTextDefault.plist"

    let dict : NSDictionary! = NSDictionary(contentsOfFile:PATH)

    let keys : [String] = dict.allKeys as! [String]

    let filtered = keys.filter() {
        return $0.rangeOfString(arguments[0]) != nil
    }

    var buf = ""

    for key in filtered
    {
        buf += (key + "\n")
    }

    print(
        buf.stringByTrimmingCharactersInSet(
            NSCharacterSet.whitespaceAndNewlineCharacterSet()
        )
    )
}