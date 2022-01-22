import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splash_screen/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        // ignore: unnecessary_this
        this.context,
        MaterialPageRoute(
          builder: (context) => const LandPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    // ignore: unnecessary_statements
    SizeConfig.mediaQueryData;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: getPropScreenHeight(896),
                  color: Colors.blue,
                ),
                // ignore: avoid_unnecessary_containers
                Text(
                  "Splash.",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: getPropScreenWidth(64),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LandPage extends StatelessWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: getPropScreenHeight(896),
          width: getPropScreenWidth(414),
          child: const Text('Home'),
        ),
      ),
    );
  }
}
