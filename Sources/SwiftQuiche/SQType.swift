//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

public enum SQType: UInt8 {
  case initial = 1
  case retry = 2
  case handshake = 3
  case zeroRTT = 4
  case versionNegotiation = 5
  case short = 6
}
