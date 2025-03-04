import 'package:flutter/services.dart';
import 'package:multistore/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //!the platform is not working
  //? section 5-35 Integrate Firebase
  // Platform.isAndroid ? await Firebase.initializeApp(
  //   options: FirebaseOptions(apiKey: apiKey,
  //   appId: appId, messagingSenderId: messagingSenderId,
  //    projectId: projectId))

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegisterScreen(),
    );
  }
}
