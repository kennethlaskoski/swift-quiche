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

public func sqNegotiateVersion(sourceID: SQConnectionID, destinationID: SQConnectionID, count: Int) -> [UInt8] {
  var buffer = [UInt8](repeating: 0, count: count)
  quiche_negotiate_version(sourceID.rawValue, sourceID.length, destinationID.rawValue, destinationID.length, &buffer, buffer.count)
  return buffer
}
