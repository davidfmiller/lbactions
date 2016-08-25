#!/usr/bin/env swift

import Foundation

let arguments = Array(Process.arguments[1 ..< Process.arguments.count])
let fileManager = NSFileManager.defaultManager()

let stderr = NSFileHandle.fileHandleWithStandardError()

for arg in arguments
{
    let url = NSURL(fileURLWithPath: arg)

    var err: NSError?
    
    if !url.checkResourceIsReachableAndReturnError(&err)
    {
        stderr.writeData("🚫  file `\(arg)` doesn't exist".dataUsingEncoding(NSUTF8StringEncoding)!)
        continue;
    }

    var val = "\(url.absoluteURL)"

    if url.pathExtension == "webloc"
    {
        let dict : NSDictionary = NSDictionary(contentsOfURL: url)!
        val = dict.objectForKey("URL") as! String
    }
    
    print(val)
}
