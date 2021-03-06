import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tdd_module/View_Model/home_view_model.dart';
import 'package:tdd_module/View_Model/sign_in_view_model.dart';
import 'package:tdd_module/utils/locator.dart';
import 'package:tdd_module/utils/prefer.dart';
import 'package:tdd_module/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  setLocator();
  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider<HomeViewModel>(
        create: (_) => HomeViewModel(),
      ),
    ],
  ));
}

class MyApp extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale;
  bool localeLoaded = false;

  @override
  void initState() {
    super.initState();
    print('initState()');

    //MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.grey[400],
//        statusBarColor: Styles.blueColor,
        statusBarIconBrightness: Brightness.light));
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(),
      child: Center(
        child: MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          theme: ThemeData(
            primaryColor: Colors.black,
            fontFamily: 'FA',
          ),
        ),
      ),
    );
  }
}
