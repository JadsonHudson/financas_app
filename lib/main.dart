// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financas_app/firebase_options.dart';
import 'package:financas_app/screens/expenses_page.dart';
import 'package:financas_app/screens/home_page.dart';
import 'package:financas_app/screens/income_page.dart';
import 'package:financas_app/screens/new_expenses_page.dart';
import 'package:financas_app/screens/new_income_page.dart';
import 'package:financas_app/screens/profile_page.dart';
import 'package:financas_app/screens/purchase_page.dart';
import 'package:financas_app/screens/sign_in.dart';
import 'package:financas_app/screens/welcome_to_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore fb = FirebaseFirestore.instance;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Financa App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeToApp(),
        '/HomePage': (context) => const HomePage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/IncomePage': (context) => const IncomePage(),
        '/ExpensesPage': (context) => const ExpensesPage(),
        '/NewIncomePage': (context) => const NewIncomePage(),
        '/NewExpensesPage': (context) => const NewExpensesPage(),
        '/PurchasePage': (context) => const PurchasePage(),
        '/SignIn': (context) => const SignIn(),
      },
    );
  }
}
