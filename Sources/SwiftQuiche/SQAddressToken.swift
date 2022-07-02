//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

public protocol SQAddressToken {
  var data: [UInt8] { get }
  init<T: Sequence>(bytes: T) where T.Element == UInt8
  var length: Int { get }

  static var maxLength: Int { get }
  func isValid() -> Bool
}

extension SQAddressToken {
  public var length: Int { data.count }
}
