import 'package:demoapp/pages/drawer/drawer.dart';
import 'package:demoapp/pages/user/ForgotPassword.dart';
import 'package:demoapp/pages/user/Login.dart';
import 'package:demoapp/pages/user/OtpVerification.dart';
import 'package:demoapp/pages/user/ResetPasswordOtp.dart';
import 'package:demoapp/pages/user/SaveResetPassword.dart';
import 'package:demoapp/pages/user/Signup.dart';
import 'package:demoapp/pages/user/SocailLogin.dart';
import 'package:demoapp/splash/splash.dart';
import 'package:demoapp/utlis/routes.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// const AndroidNotificationChannel channel=AndroidNotificationChannel(
//   'high_importance_channel',
//   'high_importance_notifications',importance: Importance.high,playSound: true);

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

//   Future <void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
//     await Firebase.initializeApp();
//     print('a big message just showing up:${message.messageId}');
//   }
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future <void> main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());

  // await flutterLocalNotificationsPlugin.
  // resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  // ?.createNotificationChannel(channel);

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge:true,
  //   sound: true
  // );
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
    // FirebaseMessaging.onMessage.listen((RemoteMessage message){
    //   RemoteNotification ?notification=message.notification;
    //   AndroidNotification ?android=message.notification?.android;
    //   if(notification!=null && android!=null){
    //     flutterLocalNotificationsPlugin.show(
    //       notification.hashCode, 
    //       notification.title, 
    //       notification.body,
    //       NotificationDetails(
    //         android:AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           color: Colors.blue,
    //           playSound: true,
    //           icon: '@mipmap/ic_launcher'
    //         )
    //       ));
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
    //   print('a new message');
    //   RemoteNotification ?notification=message.notification;
    //   AndroidNotification ?android=message.notification?.android;
    //   if(notification!=null && android!=null){
    //     showDialog(context: context, builder: (_){
    //       return AlertDialog(title: Text("$notification"),
    //       content:SingleChildScrollView(
    //         child:  Container(child: Text("$notification")),));
    //     });
    //   }
    // });

    
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      // home: App(),
      initialRoute: "/",
      routes: {
        "/": (context) => SocailLogin(),
        MyRoutes.splashRoutes:(context)=>Splash(),
        MyRoutes.homepage:(context)=>Home(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.registerRoutes:(context)=>Signup(),
        MyRoutes.forgetPasswordRoute:(context)=>ForgotPassword(),
        MyRoutes.otpVerify:(context)=>OtpVerification(),
        MyRoutes.resetPasswordOtp:(context)=>ResetPasswordOtp(),
        MyRoutes.saveResetPassword:(context)=>SaveResetPassword()
      },
    );
  }
}

// class App extends StatefulWidget{
//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   var size,height,width;

//   void showNotification(){
//       flutterLocalNotificationsPlugin.show(
//         0,
//         'texting',
//         'texting',
//         NotificationDetails(android: 
//         AndroidNotificationDetails(
//         channel.id, 
//         channel.name, 
//         importance: Importance.high,
//         color: Colors.blue,
//         playSound: true,
//         icon: '@mipmap/ic_launcher'
//         )));
//     }
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     height = size.height;
//     width = size.width;
//     return Scaffold(
//       body: Container(
//         height: height,
//         width:width,
//         child: ElevatedButton(onPressed: showNotification, child: Text('show'))),
//     );
//   }
// }






