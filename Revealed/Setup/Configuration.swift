//
//  Configuration.swift
//  Revealed
//
//  Created by Hong on 9/12/19.
//  Copyright © 2019 Pointwelve. All rights reserved.
//

import Foundation

struct Configuration: Decodable {
  enum Error: Swift.Error {
    case fileMissing, incorrectKey, unknown

    var localizedDescription: String {
      switch self {
      case .fileMissing:
        return "File not found in plist"
      case .incorrectKey:
        return "Incorrect key in plist"
      case .unknown:
        return "Unknown error when fetching configuration error"
      }
    }
  }

  let host: String
}

struct Config {
  static let shared = Config()

  let configuration: Configuration

  init(fileName: String = "GraphQL", bundle: Bundle = Bundle.main) {
    guard let url = bundle.url(forResource: fileName, withExtension: "plist") else {
      RevealedError.error(Configuration.Error.fileMissing.localizedDescription)
    }

    guard let data = try? Data(contentsOf: url) else {
      RevealedError.error(Configuration.Error.unknown.localizedDescription)
    }

    let decoder = PropertyListDecoder()
    guard let configuration = try? decoder.decode(Configuration.self, from: data) else {
      RevealedError.error(Configuration.Error.incorrectKey.localizedDescription)
    }
    self.configuration = configuration
  }
}
