//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public let sqVersion = SQVersion(rawValue: UInt32(QUICHE_PROTOCOL_VERSION))
public func isSupported(version: SQVersion) -> Bool {
  quiche_version_is_supported(version.rawValue)
}
