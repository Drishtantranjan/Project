import 'package:shared/shared.dart';

class SharedAssetProvider {
  const SharedAssetProvider._();
  static const String prefix = 'assets';

  static const String backIcon = 'arrow-icon.svg';
  static const String logoIcon = 'logo.png';

  static AssetBuilder imageAsset = intelligentAsset("shared", prefix: prefix);

}