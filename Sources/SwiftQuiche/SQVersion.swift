//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public typealias SQVersion = UInt32

public let sqVersion1: SQVersion = 0x0000_0001
public let sqVersionDraft27: SQVersion = 0xff00_001b
public let sqVersionDraft28: SQVersion = 0xff00_001c
public let sqVersionDraft29: SQVersion = 0xff00_001d

public let sqVersion = SQVersion(QUICHE_PROTOCOL_VERSION)

public func sqSupports(version: SQVersion) -> Bool {
  quiche_version_is_supported(version)
}
