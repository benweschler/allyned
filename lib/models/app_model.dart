import 'package:allyned/themes.dart';
import 'package:allyned/utils/types/easy_notifier.dart';

class AppModel extends EasyNotifier {
  static final AppTheme _defaultTheme = AppTheme.fromType(ThemeType.light);

  /// The active theme for the app.
  AppTheme _theme = _defaultTheme;

  AppTheme get theme => _theme;
  set theme(AppTheme theme) => notify(() => _theme = theme);
}
