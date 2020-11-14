import 'package:elagi/utils/appStyles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeData theme = AppStyles.theme;
  Key key = UniqueKey();
  GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  ThemeData get getTheme => theme;

  void setKey(value) {
    key = value;
    notifyListeners();
  }

  void setNavigatorKey(value) {
    navigatorkey = value;
    notifyListeners();
  }
}
