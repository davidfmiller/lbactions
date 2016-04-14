#!/usr/bin/env swift

import Foundation
import Cocoa

let arguments = Array(Process.arguments[1 ..< Process.arguments.count])

for path in arguments
{

    let data = NSData(contentsOfFile: path)
    let url = NSURL(fileURLWithPath: path)

    var mime = ""
    let pathExtension = url.pathExtension!
    
    switch(pathExtension)
    {
        case "pdf":
            mime = "application/pdf"
        case "png":
            mime = "image/png"
            break;
        case "jpg":
            mime = "image/jpeg"
        case "jpeg":
            mime = "image/jpeg"
        case "gif":
            mime = "image/png"
            break;
        case "css":
            mime = "text/css"
        case "js":
            mime = "application/javascript"
        case "svg":
            mime = "image/svg+xml"
        case "json":
            mime = "application/javascript"
        default:
            mime = "text/plain"
        
    }

    let base64String = "data:" + mime + ";charset=UTF-8;base64," + data!.base64EncodedStringWithOptions([])
    print(base64String)

}