#!/usr/bin/env swift

import Foundation
import Cocoa

let formatter = ISO8601DateFormatter()
formatter.formatOptions = [
    .withInternetDateTime,
    .withTimeZone
]
formatter.timeZone = .current

print(formatter.string(from: Date()))
