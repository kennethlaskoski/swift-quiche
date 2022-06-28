//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public typealias SQQuicVersion = UInt32

public let sqQuicVersion = SQQuicVersion(QUICHE_PROTOCOL_VERSION)

public func isSQSupported(version: SQQuicVersion) -> Bool {
  quiche_version_is_supported(version)
}
