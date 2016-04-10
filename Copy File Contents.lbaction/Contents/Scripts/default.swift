#!/usr/bin/env swift

import Foundation
import Cocoa

// Note: The first argument is the script's path
let arguments = Array(Process.arguments[1 ..< Process.arguments.count])
let pasteboard = NSPasteboard.generalPasteboard()
pasteboard.clearContents()

for path in arguments
{
    do
    {
      let contents = try NSString(contentsOfFile:path, encoding: NSUTF8StringEncoding)
      pasteboard.writeObjects([contents])
    }
    catch {
    }
}
