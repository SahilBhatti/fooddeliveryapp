import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/pages/user/ForgotPassword.dart';
import 'package:demoapp/pages/user/Login.dart';
import 'package:demoapp/pages/user/OtpVerification.dart';
import 'package:demoapp/pages/user/ResetPasswordOtp.dart';
import 'package:demoapp/pages/user/SaveResetPassword.dart';
// import 'package:demoapp/pages/user/Signup.dart';
import 'package:demoapp/pages/user/SocailLogin.dart';
import 'package:demoapp/splash/splash.dart';
import 'package:demoapp/utlis/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// var size,height,width;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData(brightness: Brightness.dark),
      // home: App(),
      initialRoute: "/",
      routes: {
        "/": (context) => SocailLogin(),
        MyRoutes.splashRoutes: (context) => Splash(),
        MyRoutes.homepage: (context) => Home(userProfile: '',email: '',name: '',),
        MyRoutes.loginRoute: (context) => Login(),
        // MyRoutes.registerRoutes:(context)=>Signup(),
        MyRoutes.forgetPasswordRoute: (context) => ForgotPassword(),
        MyRoutes.otpVerify: (context) => OtpVerification(),
        MyRoutes.resetPasswordOtp: (context) => ResetPasswordOtp(),
        MyRoutes.saveResetPassword: (context) => SaveResetPassword()
      },
    );
  }
}
