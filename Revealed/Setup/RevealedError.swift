//
//  RevealedError.swift
//  Revealed
//
//  Created by Hong on 9/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Foundation
struct RevealedError {
  static var fatalErrorClosure: (String, StaticString, UInt) -> Never = defaultFatalErrorClosure

  private static let defaultFatalErrorClosure = { Swift.fatalError($0, file: $1, line: $2) }

  static func replaceFatalError(closure: @escaping (String, StaticString, UInt) -> Never) {
    fatalErrorClosure = closure
  }

  static func restoreFatalError() {
    fatalErrorClosure = defaultFatalErrorClosure
  }

  static func error(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    RevealedError.fatalErrorClosure(message(), file, line)
  }
}
