//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

public struct SQVersion {
  private let data: UInt32
}

extension SQVersion: RawRepresentable {
  public typealias RawValue = UInt32
  public var rawValue: RawValue { data }
  public init(rawValue: RawValue) {
    data = rawValue
  }
}

extension SQVersion: ExpressibleByIntegerLiteral {
  public typealias IntegerLiteralType = RawValue
  public init(integerLiteral value: IntegerLiteralType) {
    self.init(rawValue: value)
  }
}

extension SQVersion {
  public static let version1: SQVersion = 0x0000_0001
  public static let versionDraft27: SQVersion = 0xff00_001b
  public static let versionDraft28: SQVersion = 0xff00_001c
  public static let versionDraft29: SQVersion = 0xff00_001d
}

extension SQVersion: Sendable, Equatable, Hashable {}

extension SQVersion: Codable {}

extension SQVersion: CustomStringConvertible {
  public var description: String {
    "\(String(rawValue, radix: 16))"
  }
}
