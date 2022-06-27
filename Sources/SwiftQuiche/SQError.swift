//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public enum SQError: quiche_error, Error {
  case done = -1
  case bufferTooShort = -2
  case unknownVersion = -3
  case invalidFrame = -4
  case invalidPacket = -5
  case invalidState = -6
  case invalidStreamState = -7
  case invalidTransportParam = -8
  case cryptoFail = -9
  case tlsFail = -10
  case flowControl = -11
  case streamLimit = -12
  case streamStopped = -15
  case streamReset = -16
  case finalSize = -13
  case congestionControl = -14
//  case idLimit
//  case outOfIdentifiers
}

extension quiche_error: ExpressibleByIntegerLiteral {
  public init(integerLiteral value: Int32) {
    self.init(rawValue: value)
  }
}
