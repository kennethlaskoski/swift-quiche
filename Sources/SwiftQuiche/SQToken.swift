//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import Darwin

public struct SQToken {
  let data: [UInt8]

  init<T: Sequence>(bytes: T) where T.Element == UInt8 {
    data = Array<UInt8>(bytes)
  }

  public var length: Int { data.count }
}

extension SQToken {
  public static var maxLength: Int {
    var result = "quiche".utf8CString.count - 1
    result += MemoryLayout<sockaddr_storage>.size
    result += SQConnectionID.maxLength
    return result
  }
}
