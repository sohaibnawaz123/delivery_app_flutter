class AppAsset {
  AppAsset._internal();
  static final AppAsset _instance = AppAsset._internal();

  factory AppAsset() {
    return _instance;
  }
  final String appImagesPath = 'assets/images/';
  final String appIconPath = 'assets/icons/';
  static const String applogo = 'assets/images/onboarding.png';
  static String back = 'asset/icon/back.svg';

  static String eye = 'asset/icon/eye.svg';
  static String eyeOff = 'asset/icon/eye_off.svg';
  static String image = 'asset/icon/image.svg';

}
