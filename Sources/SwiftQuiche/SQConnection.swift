//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public final class SQConnection {
  private let connection: OpaquePointer
  init(connection: OpaquePointer) {
    self.connection = connection
  }
}

extension SQConnection: RawRepresentable {
  public typealias RawValue = OpaquePointer?
  public var rawValue: RawValue { connection }
  convenience public init?(rawValue: RawValue) {
    guard let connection = rawValue else {
      return nil
    }
    self.init(connection: connection)
  }
}
