import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:movie_reference/pages/splash_page.dart';
import 'package:movie_reference/styles.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  _OfflinePageState createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Oops you're offline"),
            loading? const CircularProgressIndicator(
              color: Color(0xffc1a400),
            ) : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  var connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult != ConnectivityResult.none) {
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SplashPage()));
                  }
                },
                child: const Text("Try again")),
          ],
        ),
      ),
    );
  }
}
