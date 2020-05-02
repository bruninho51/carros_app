import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  Splash({Key key, this.child, this.seconds}) : super(key: key);
  final Widget child;
  final int seconds;

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return _introScreen(widget.child, widget.seconds);
  }
}

Widget _introScreen(child, seconds) {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: seconds,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffED213A),
            Color(0xff93291E)
          ],
        ),
        navigateAfterSeconds: child,
        loaderColor: Colors.transparent,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: SvgPicture.asset(
          "assets/splash.svg",
          semanticsLabel: 'logo',
        )
        ),
      ),
    ],
  );
}