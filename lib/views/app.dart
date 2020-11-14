import 'package:elagi/utils/appStyles.dart';
import 'package:elagi/utils/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../controllers/app_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (ctx, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStyles.appArName,
            theme: model.theme,
            // key: model.key,
            // navigatorKey: model.navigatorkey,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "AE"),
            ],
            initialRoute: "/Splash",
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
