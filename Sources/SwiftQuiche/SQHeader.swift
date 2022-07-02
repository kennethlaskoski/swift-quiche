//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

public struct SQHeader {
  let type: SQType
  let version: SQVersion
  let dcid: SQConnectionID
  let scid: SQConnectionID
  let token: SQAddressToken?
  let versions: [SQVersion]?
}
