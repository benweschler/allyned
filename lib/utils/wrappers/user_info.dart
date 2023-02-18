import 'package:allyned/utils/wrappers/home_info.dart';
import 'package:allyned/utils/wrappers/substance_use.dart';

class UserInfo {
  final String name;
  final String pronouns;
  final List<SubstanceUse> substanceUse;
  final String bio;
  final String profilePicPath;

  UserInfo({
    required this.name,
    required this.pronouns,
    required this.substanceUse,
    required this.bio,
    required this.profilePicPath,
  });
}

class HomeownerInfo extends UserInfo {
  final HomeInfo homeInfo;
  final int cardBackground;

  HomeownerInfo({
    required super.name,
    required super.pronouns,
    required super.substanceUse,
    required super.bio,
    required super.profilePicPath,
    required this.homeInfo,
    required this.cardBackground,
  }) : assert(0 <= cardBackground && cardBackground < 6);
}
