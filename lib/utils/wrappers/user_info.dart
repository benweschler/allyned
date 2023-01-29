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

class HomeownerInfo {
  final String name;
  final String pronouns;
  final List<SubstanceUse> substanceUse;
  final String bio;
  final String profilePicPath;
  final HomeInfo homeInfo;

  HomeownerInfo({
    required this.name,
    required this.pronouns,
    required this.substanceUse,
    required this.bio,
    required this.profilePicPath,
    required this.homeInfo,
  });
}
