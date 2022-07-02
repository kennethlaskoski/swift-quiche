//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public struct SQConnectionID {
  let data: [UInt8]

  init<T: Sequence>(bytes: T) where T.Element == UInt8 {
    data = [UInt8](bytes)
  }

  public var length: Int { data.count }
}

extension SQConnectionID {
  public static var maxLength: Int { Int(QUICHE_MAX_CONN_ID_LEN) }
}

extension SQConnectionID: RawRepresentable {
  public typealias RawValue = [UInt8]
  public var rawValue: [UInt8] { data }
  public init(rawValue: [UInt8]) {
    data = rawValue
  }
}

extension SQConnectionID: Sendable, Equatable, Hashable {}

extension SQConnectionID: Codable {}

extension SQConnectionID: CustomStringConvertible {
  public var description: String {
    data.reduce("") { (result, byte) in result + String(byte, radix: 16) }
  }
}
