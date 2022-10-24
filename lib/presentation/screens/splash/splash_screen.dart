import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magdsofttask/presentation/screens/details/details_Screen.dart';
import 'package:magdsofttask/presentation/screens/login/login_screen.dart';

import '../../../data/data_providers/local/cache_helper.dart';

class SplashWidget extends StatefulWidget {
  //static const routeName = 'SplashWidget';

  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: 5), _goNext);
  }

  _goNext() async {
    String? token = CacheHelper.getData(key: 'login');
      if (token != null) {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(),
          ),
        );
      } else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff04352d),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/1.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:const [
                     CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Created By Omar Farouk')
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
