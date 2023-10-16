import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final em = TextEditingController();
  final pw = TextEditingController();
  final AuthService _auth = AuthService();
  signUp() async {
    final User? user = await _auth.signUP(em.text, pw.text);
    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("signup successfull")));
    }
  }

  signin() async {
    final User? user = await _auth.login(em.text, pw.text);
    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("login successfull")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        child: Column(children: [
          TextFormField(
            controller: em,
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(
            controller: pw,
            decoration: InputDecoration(
              labelText: 'password',
              hintText: 'Enter your password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          ElevatedButton(onPressed: signin, child: Text("login")),
          ElevatedButton(onPressed: signUp, child: Text("Signup")),
        ]),
      ),
    );
  }
}
