import 'package:allyned/utils/types/easy_notifier.dart';
import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:allyned/utils/wrappers/substance_use.dart';

class UserModel extends EasyNotifier {
  UserModel({
    required Map<String, CareProvider> careProviders,
    required String name,
    required String pronouns,
    required List<SubstanceUse> substanceUse,
    required String bio,
    required String profilePicPath,
  })  : _name = name,
        _providerMap = careProviders,
        _pronouns = pronouns,
        _substanceUse = substanceUse,
        _bio = bio,
        _profilePicPath = profilePicPath,
        assert(careProviders.isNotEmpty);

  // Care Providers
  final Map<String, CareProvider> _providerMap;

  Iterable<CareProvider> get careProviders => _providerMap.values;

  CareProvider? getProviderByID(String providerID) => _providerMap[providerID];

  bool removeProvider(String providerID) {
    notifyListeners();
    return _providerMap.remove(providerID) != null;
  }

  ///////////////////////////////
  // Personal Info
  ///////////////////////////////

  // Name
  String _name;

  String get name => _name;

  set name(String value) => notify(() => _name = value);

  // Pronouns
  String _pronouns;

  String get pronouns => _pronouns;

  set pronouns(String value) => notify(() => _pronouns = value);

  // Substance use
  List<SubstanceUse> _substanceUse;

  List<SubstanceUse> get substanceUse => _substanceUse;

  set substanceUse(List<SubstanceUse> value) =>
      notify(() => _substanceUse = value);

  // Bio
  String _bio;

  String get bio => _bio;

  set bio(String value) => notify(() => _bio = value);

  // Profile Picture
  // This is currently a hard coded bundle path to avoid cloud storage charges.
  String _profilePicPath;

  String get profilePicPath => _profilePicPath;

  set profilePicPath(String value) => notify(() => _profilePicPath = value);
}
