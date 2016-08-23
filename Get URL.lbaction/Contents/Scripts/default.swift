#!/usr/bin/env swift

// LaunchBar Action Script

import Foundation


let arguments = Array(Process.arguments[1 ..< Process.arguments.count])
for arg in arguments
{
    let url = NSURL(fileURLWithPath: arg)
    
    do {
        
        let doc = try NSXMLDocument(contentsOfURL: url, options: Int(NSXMLDocumentContentKind.XMLKind.rawValue));
        
        let root = doc.rootElement()!;
        let nodes = try root.nodesForXPath("./dict/string")
        
        for i in nodes
        {
            let value = i.childAtIndex(0)!
            print("\(value.stringValue!)")
        }
    }
    catch
    {
        print(url.absoluteURL)
    }
}
