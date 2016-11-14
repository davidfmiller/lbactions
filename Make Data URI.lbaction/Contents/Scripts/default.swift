#!/usr/bin/env swift

import Foundation
import Cocoa

let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])

for path in arguments
{
    
    let data = NSData(contentsOfFile: path)
    let url = NSURL(fileURLWithPath: path)
    
    var mime = ""
    let pathExtension = url.pathExtension!
    
    switch(pathExtension)
    {
    case "css":
        mime = "text/css"
    case "gif":
        mime = "image/gif"
    case "htm":
        mime = "text/html"
    case "html":
        mime = "text/html"
    case "jpg":
        mime = "image/jpeg"
    case "jpeg":
        mime = "image/jpeg"
    case "js":
        mime = "application/javascript"
    case "json":
        mime = "application/javascript"
    case "pdf":
        mime = "application/pdf"
    case "png":
        mime = "image/png"
        break;
        
    case "svg":
        mime = "image/svg+xml"
    default:
        mime = "text/plain"
        
    }
    
    let base64String = "data:" + mime + ";charset=UTF-8;base64," + data!.base64EncodedString()
    print(base64String)
    
}
