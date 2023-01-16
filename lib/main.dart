import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:otp_auth/pages/home_page.dart';
import 'package:otp_auth/pages/mobile_number_screen.dart';
import 'package:otp_auth/pages/profile_selection_screen.dart';
import 'package:otp_auth/pages/verification_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: '/home',
      routes: {
        '/home' :(context) =>  const HomePage(),
        '/mobile' :(context) => const MobileNumberScreen(),
        '/verify' : (context) =>  VerificationScreen(),
        '/profile' :(context) => const ProfileSelectionScreen(),  
            },
    );
  }
}

