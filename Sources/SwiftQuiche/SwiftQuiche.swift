//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche
import NIOCore

public let sqVersion = SQVersion(rawValue: UInt32(QUICHE_PROTOCOL_VERSION))
public func isSupported(version: SQVersion) -> Bool {
  quiche_version_is_supported(version.rawValue)
}

public func sqAccept(
  sourceID: SQConnectionID,
  originalDestinationID: SQConnectionID?,
//  localAddress: SocketAddress,
  peerAddress: SocketAddress,
  config: SQConfig
) -> SQConnection? {
  peerAddress.withSockAddr { (peerAddr, length) -> SQConnection? in
    let pointer = quiche_accept(
      sourceID.rawValue, sourceID.length,
      originalDestinationID?.rawValue, originalDestinationID?.length ?? 0,
      peerAddr, length,
      config.rawValue
    )
    return SQConnection(rawValue: pointer)
  }
}

public func sqConnect(
  serverName: String,
  sourceID: SQConnectionID,
//  localAddress: SocketAddress,
  peerAddress: SocketAddress,
  config: SQConfig
) -> SQConnection? {
  peerAddress.withSockAddr { (peerAddr, length) -> SQConnection? in
    let pointer = quiche_connect(
      serverName,
      sourceID.rawValue, sourceID.length,
      peerAddr, length,
      config.rawValue
    )
    return SQConnection(rawValue: pointer)
  }
}
