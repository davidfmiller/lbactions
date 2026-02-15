#!/usr/bin/env swift

// LaunchBar Action Script

import Foundation
import Cocoa

let arguments = Array(CommandLine.arguments[1 ..< CommandLine.arguments.count])

import Foundation

extension String {
  var slug: String {
    // 1. Lowercase
    var slug = self.lowercased()
    
    // 2. Remove diacritics (é -> e, ü -> u, etc.)
    slug = slug.folding(options: .diacriticInsensitive, locale: .current)
    
    // 3. Keep only letters, numbers, and spaces
    slug = slug.unicodeScalars
        .map { CharacterSet.alphanumerics.contains($0) || $0 == " " ? Character($0) : " " }
        .reduce(into: "") { $0.append($1) }
    
    // 4. Replace one or more spaces with a single hyphen
    slug = slug
        .replacingOccurrences(of: "\\s+", with: "-", options: .regularExpression)
    
    // 5. Trim hyphens from start/end
    slug = slug.trimmingCharacters(in: CharacterSet(charactersIn: "-"))
    
    return slug
  }
}


for arg in arguments
{
  print(arg.slug)
}
