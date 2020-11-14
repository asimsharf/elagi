import 'package:elagi/views/login.dart';
import 'package:elagi/views/otp_verify.dart';
import 'package:elagi/views/register.dart';
import 'package:flutter/material.dart';

import '../utils/appStyles.dart';
import '../utils/route_argument.dart';
import '../views/home.dart';
import '../views/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print("####### arguments:\t$args\t:arguments ########");
    print("####### name:\t${settings.name}\t:name ########");
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute(
          builder: (_) => Splash(),
        );
      case '/Login':
        print(settings.name);
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case '/Register':
        print(settings.name);
        return MaterialPageRoute(
          builder: (_) => Register(),
        );
      case '/OtpVerify':
        print(settings.name);
        return MaterialPageRoute(
          builder: (_) => OtpVerify(
            routeArgument: args as RouteArgument,
          ),
        );
      case '/Home':
        print(settings.name);
        return MaterialPageRoute(
          builder: (_) => Home(
            routeArgument: RouteArgument(param: AppStyles.appArName),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Home(
            routeArgument: RouteArgument(param: AppStyles.appArName),
          ),
        );
    }
  }
}
