//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCQuiche

public final class SQConfig {
  private let config: OpaquePointer

  init?(version: SQVersion) {
    let result = quiche_config_new(version)
    guard let config = result else {
      return nil
    }
    self.config = config
  }

  deinit {
    quiche_config_free(config)
  }

  public func loadCertChainFromPEMFile(path: String) throws {
    if quiche_config_load_cert_chain_from_pem_file(config, path) != 0 {
      throw SQError.tlsFail
    }
  }

  public func loadPrivKeyFromPEMFile(path: String) throws {
    if quiche_config_load_priv_key_from_pem_file(config, path) != 0 {
      throw SQError.tlsFail
    }
  }

  public func loadVerifyLocationsFromFile(path: String) throws {
    if quiche_config_load_verify_locations_from_file(config, path) != 0 {
      throw SQError.tlsFail
    }
  }

  public func loadVerifyLocationsFromDirectory(path: String) throws {
    if quiche_config_load_verify_locations_from_directory(config, path) != 0 {
      throw SQError.tlsFail
    }
  }

  public func verifyPeer(_ v: Bool) {
    quiche_config_verify_peer(config, v)
  }

  public func grease(_ v: Bool) {
    quiche_config_grease(config, v)
  }

  public func logKeys() {
    quiche_config_log_keys(config)
  }

  public func enableEarlyData() {
    quiche_config_enable_early_data(config)
  }

  public func setApplicationProtos(protos: String) throws {
    if quiche_config_set_application_protos(config, protos, protos.utf8CString.count - 1) != 0 {
      throw SQError.tlsFail
    }
  }

  public func setMaxIdleTimeout(_ v: UInt64) {
    quiche_config_set_max_idle_timeout(config, v)
  }

  public func setMaxRecvUDPPayloadSize(_ v: Int) {
    quiche_config_set_max_recv_udp_payload_size(config, v)
  }

  public func setMaxSendUDPPayloadSize(_ v: Int) {
    quiche_config_set_max_send_udp_payload_size(config, v)
  }

  public func setInitialMaxData(_ v: UInt64) {
    quiche_config_set_initial_max_data(config, v)
  }

  public func setInitialMaxStreamDataBidiLocal(_ v: UInt64) {
    quiche_config_set_initial_max_stream_data_bidi_local(config, v)
  }

  public func setInitialMaxStreamDataBidiRemote(_ v: UInt64) {
    quiche_config_set_initial_max_stream_data_bidi_remote(config, v)
  }

  public func setInitialMaxStreamDataUni(_ v: UInt64) {
    quiche_config_set_initial_max_stream_data_uni(config, v)
  }

  public func setInitialMaxStreamsBidi(_ v: UInt64) {
    quiche_config_set_initial_max_streams_bidi(config, v)
  }

  public func setInitialMaxStreamsUni(_ v: UInt64) {
    quiche_config_set_initial_max_streams_uni(config, v)
  }

  public func setAckDelayExponent(_ v: UInt64) {
    quiche_config_set_ack_delay_exponent(config, v)
  }

  public func setMaxAckDelay(_ v: UInt64) {
    quiche_config_set_max_ack_delay(config, v)
  }

  public func setDisableActiveMigration(_ v: Bool) {
    quiche_config_set_disable_active_migration(config, v)
  }

  // TODO: bridge quiche_cc_algorithm
  public func setCCAlgorithm(_ algo: quiche_cc_algorithm) {
    quiche_config_set_cc_algorithm(config, algo)
  }
/*
  public func setCCAlgorithmName(_ name: String) throws {
    if quiche_config_set_cc_algorithm_name(config, name) != 0 {
      throw SQConfigError.setCCAlgorithmNameFailure
    }
  }
*/
  public func enableHystart(_ v: Bool) {
    quiche_config_enable_hystart(config, v)
  }

  public func enableDGRAM(_ enabled: Bool, _ recvQueueLen: Int, _ sendQueueLen: Int) {
    quiche_config_enable_dgram(config, enabled, recvQueueLen, sendQueueLen)
  }

  public func setMaxConnectionWindow(_ v: UInt64) {
    quiche_config_set_max_connection_window(config, v)
  }

  public func setMaxStreamWindow(_ v: UInt64) {
    quiche_config_set_max_stream_window(config, v)
  }
/*
  public func setActiveConnectionIDLimit(_ v: UInt64) {
    quiche_config_set_active_connection_id_limit(config, v)
  }

  public func setStatelessResetToken(_ v: UnsafePointer<UInt8>) {
    quiche_config_set_stateless_reset_token(config, v)
  }
*/
}

extension SQConfig {
  convenience init() {
    self.init(version: sqVersion)!
  }
}
