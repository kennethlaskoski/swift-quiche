//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public struct SQConnectionID {
  private let data: [UInt8]

  init<T: Sequence>(bytes: T) where T.Element == UInt8 {
    data = Array<UInt8>(bytes)
  }

  public var length: Int { data.count }
}

extension SQConnectionID {
  public static var maxLength: Int { Int(QUICHE_MAX_CONN_ID_LEN) }
}
