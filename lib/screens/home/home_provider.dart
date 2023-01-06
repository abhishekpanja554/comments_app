import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider(
    (StateNotifierProviderRef<LeaveNotifier, MaskEmailModel> ref) =>
        LeaveNotifier(ref));

class LeaveNotifier extends StateNotifier<MaskEmailModel> {
  Ref ref;
  LeaveNotifier(this.ref) : super(MaskEmailModel.init());

  updateEmailMaskFlag() {}
}

class MaskEmailModel {
  bool isMaskEmail;
  final FirebaseRemoteConfig remoteConfig;
  MaskEmailModel({required this.isMaskEmail, required this.remoteConfig});

  factory MaskEmailModel.init() {
    bool isMaskEmail = false;
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    Future<void> initConfig() async {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(seconds: 10),
      ));

      await remoteConfig.fetchAndActivate();
    }
    initConfig();
    return MaskEmailModel(isMaskEmail: isMaskEmail, remoteConfig: remoteConfig);
  }

  MaskEmailModel copyWith(
      {bool? isMaskEmail, FirebaseRemoteConfig? remoteConfig}) {
    return MaskEmailModel(
        isMaskEmail: isMaskEmail ?? this.isMaskEmail,
        remoteConfig: remoteConfig ?? this.remoteConfig);
  }
}
