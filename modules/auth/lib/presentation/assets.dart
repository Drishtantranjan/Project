import 'package:flutter/material.dart';

import 'package:shared/shared.dart';

class AssetProvider {
  AssetProvider._();

  static const String prefix = 'assets';

  static const String logo = 'logo.png';

  static const String textFieldWarningIcon = 'textfield-warning-icon.svg';
  static const String dropDownIcon = 'dropdown-icon.svg';
  static const String eyeIcon = 'eye-icon.svg';
  static const String hiddenEyeIcon = 'hidden-eye-icon.svg';

  static const String walkthroughBackground = 'walkthrough-background.png';
  static const String walkthroughBanner1 = logo;
  static const String walkthroughBanner2 = 'walkthrough-banner-02.svg';
  static const String walkthroughBanner3 = 'walkthrough-banner-03.svg';
  static const String loginBanner = 'login-banner.svg';
  static const String signupBanner = 'signup-banner.svg';
  static const String forgotPasswordBanner = 'forgot-password-banner.svg';
  static const String setPasswordBanner = 'set-password-banner.svg';
  static const String resetPasswordBanner = setPasswordBanner;
  static const String signingTermsBanner = 'signing-terms-banner.svg';
  static const String otpBannerDoggy = 'otp-banner-doggy.gif';

  static ImageProvider<Object> image(String asset) {
    return AssetImage('$prefix/$asset', package: "auth");
  }

}

AssetBuilder imageAsset = intelligentAsset("auth", prefix: AssetProvider.prefix);
