import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:movie_reference/pages/main_page.dart';
import 'package:movie_reference/styles.dart';

import 'offline_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      controller.forward().then((_) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MainPage()));
      });
    } else {
      controller.forward().then((_) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const OfflinePage()));
      });
    }
  }

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            backgroundColor,
            const Color(0xffc1a400).withOpacity(0.9),
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset("assets/images/app_logo.png"),
    );
  }
}
