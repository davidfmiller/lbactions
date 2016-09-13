#!/usr/bin/env swift

import Foundation

let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])
let fileManager = FileManager.default

let stderr = FileHandle.standardError

for arg in arguments
{
    let url = NSURL(fileURLWithPath: arg)

    var err: NSError?
    
    if !url.checkResourceIsReachableAndReturnError(&err)
    {
        stderr.write("🚫  file `\(arg)` doesn't exist".data(using: String.Encoding.utf8)!)
        continue;
    }

    var val = "\(url.absoluteURL)"

    if url.pathExtension == "webloc"
    {
        let dict : NSDictionary = NSDictionary(contentsOf: url as URL)!
        val = dict["URL"] as! String
    }

    print(val)
}
