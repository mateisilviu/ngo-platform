import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'core/providers/user_provider.dart';
import 'core/services/category_db_service.dart';
import 'dashboard/controllers/controller.dart';
import 'firebase_options.dart';
import 'ui/homepage.dart';
import 'ui/parts/categories_grid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // DatabaseServiceCategory().init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Controller>(create: (context) => Controller()),
      ChangeNotifierProvider<UserModel>(create: (context) => UserModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unde sa donez?',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 16.0),
          )),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Thank you for your donation'),
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
  @override
  Widget build(BuildContext context) {
    return HomePageScreen();
  }
}
