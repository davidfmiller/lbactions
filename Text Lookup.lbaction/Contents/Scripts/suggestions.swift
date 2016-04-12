#!/usr/bin/env swift

import Foundation
import Cocoa

let argument = Array(Process.arguments[1 ..< Process.arguments.count])[0]

let PATH = "../Resources/textexpander.plist"

let dict : NSDictionary! = NSDictionary(contentsOfFile:PATH)

let keys : [String] = dict.allKeys as! [String]

let filtered = keys.filter() {
    return $0.rangeOfString(argument) != nil
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