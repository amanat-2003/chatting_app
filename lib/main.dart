import 'package:chatting_app/helper/helper_function.dart';
import 'package:chatting_app/pages/auth/login_register_page.dart';
import 'package:chatting_app/service/functions.dart';
import 'package:chatting_app/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // initialization for web
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: Constants.apiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ));
  } else {
    // initialization for android, iOS
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    // setState(() async {
    // _isSignedIn = (await HelperFunctions.getUserLoggedInStatus()) ?? false;
    // });
    var val = await HelperFunctions.getUserLoggedInStatus();
    if (val != null) {
      _isSignedIn = val;
    } else {
      _isSignedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color.fromARGB(255, 238, 104, 14)),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: _isSignedIn ? const HomePage() : const LoginRegisterPage(),
    );
  }
}
