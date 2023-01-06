import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider(
    (StateNotifierProviderRef<LeaveNotifier, MaskEmailModel> ref) =>
        LeaveNotifier(ref));

class LeaveNotifier extends StateNotifier<MaskEmailModel> {
  Ref ref;
  LeaveNotifier(this.ref) : super(MaskEmailModel.init());

  init() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));

    await remoteConfig.fetchAndActivate();
    state = state.copyWith(remoteConfig: remoteConfig);
  }

  bool fetchVal(){
    init();
    return state.remoteConfig.getBool("is_mask_email");
  }
}

class MaskEmailModel {
  bool isMaskEmail;
  final FirebaseRemoteConfig remoteConfig;
  MaskEmailModel({required this.isMaskEmail, required this.remoteConfig});

  factory MaskEmailModel.init() {
    bool isMaskEmail = false;
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    return MaskEmailModel(isMaskEmail: isMaskEmail, remoteConfig: remoteConfig);
  }

  MaskEmailModel copyWith(
      {bool? isMaskEmail, FirebaseRemoteConfig? remoteConfig}) {
    return MaskEmailModel(
        isMaskEmail: isMaskEmail ?? this.isMaskEmail,
        remoteConfig: remoteConfig ?? this.remoteConfig);
  }
}
