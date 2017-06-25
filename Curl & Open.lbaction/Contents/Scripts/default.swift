#!/usr/bin/env swift

import Darwin
import Foundation

let stderr = FileHandle.standardError

let arguments = Array(CommandLine.arguments.dropFirst())

if (arguments.count != 1) {
  stderr.write("🚫  Invalid usage\n".data(using: String.Encoding.utf8, allowLossyConversion : false)!)
  exit(0)
}

let sema = DispatchSemaphore( value: 0 )


if let url = URL(string: arguments[0]){

  let request = URLRequest(url: url)
  let session = URLSession(configuration: URLSessionConfiguration.default)

  session.dataTask(with:request, completionHandler:{data, response, error -> Void in

    if (error != nil) {
      stderr.write("🚫  \(arguments[0]) is an invalid URL\n".data(using: String.Encoding.utf8, allowLossyConversion : false)!)
      exit(0)
    }

    let mime = response!.mimeType! as NSString
    let ext : String = mime.components(separatedBy: "/").last!

    let template = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("\(url.host!).\(ext)")

    if let data = data {

      do {
        try data.write(to: template!, options: .atomic)
      } catch {
        stderr.write("🚫  Unable to write response to \(template!)\n".data(using: String.Encoding.utf8, allowLossyConversion : false)!)
        exit(0)
      }
      
      

    }
    sema.signal()
  }).resume()

  sema.wait()
} else {


}
