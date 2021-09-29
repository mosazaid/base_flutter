import 'package:firebase_core/firebase_core.dart';
import 'package:JordanElectricPowerCompany/routes.dart';
import 'package:JordanElectricPowerCompany/utils/translations_delegate_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'config/size_config.dart';
import 'core/service/NavigationService.dart';
import 'core/viewModel/AuthenticationViewModel.dart';
import 'core/viewModel/project_view_model.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppGlobal.CONTEX = context;

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig().init(constraints, orientation);
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthenticationViewModel>(
                  create: (context) => AuthenticationViewModel()),
              ChangeNotifierProvider<ProjectViewModel>(
                create: (context) => ProjectViewModel(),
              ),
            ],
            child: Consumer<ProjectViewModel>(
                builder: (context, projectProvider, child) => MaterialApp(
                      showSemanticsDebugger: false,
                      title: 'Jordan Electric Power Company',
                      locale: projectProvider.appLocal,
                      localizationsDelegates: [
                        TranslationBaseDelegate(),
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      supportedLocales: [
                        const Locale('ar', ''), // Arabic
                        const Locale('en', ''), // English
                      ],
                      theme: ThemeData(
                        primarySwatch: Colors.grey,
                        primaryColor: Colors.grey,
                        buttonColor: Color(0xFF007fc3),
                        fontFamily: 'Poppins',
                        dividerColor: Colors.grey[350],
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      navigatorKey: locator<NavigationService>().navigatorKey,
                      initialRoute: INIT_ROUTE,
                      routes: routes,
                      debugShowCheckedModeBanner: false,
                    )),
          );
        });
      },
    );
  }
}
