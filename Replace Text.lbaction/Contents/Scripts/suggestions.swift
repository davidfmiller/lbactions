#!/usr/bin/env swift

import Foundation
import Cocoa

let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])

if arguments.count < 1
{
}
else
{
    let PATH = "../Resources/ReplaceTextDefault.plist"

    let dict : NSDictionary! = NSDictionary(contentsOfFile:PATH)

    let keys : [String] = dict.allKeys as! [String]

    let filtered = keys.filter() {
        return $0.range(of:arguments[0].trimmingCharacters(in: CharacterSet.whitespaces)) != nil
    }

    var buf = ""

    for key in filtered
    {
        buf += (key + "\n")
    }

    print(
        buf.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines
        )
    )
}
