import 'package:flutter/material.dart';
import 'package:recycle_app/pages/auth_page.dart';
import 'pages/login.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//test@gmail.com / test123
//mitch@gmail.com / mitch123
//anakin@gmail.com / anakin123
//çinar@gmail.com / çinar123
//deno@gmail.com / deno123


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
     home: AuthPage(),
    );
  }
}
