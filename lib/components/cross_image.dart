import 'dart:async';

import 'package:flutter/material.dart';

class CrossImage extends StatefulWidget {
  @override
  _CrossImageState createState() => _CrossImageState();

  CrossImage(this.images);

  final List<dynamic> images;

}

class _CrossImageState extends State<CrossImage> {

  int actual = 0;

  Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 5);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          int actualAux = actual +1;
            actual = actualAux == widget.images.length ? 0 : actualAux;
        },
      ),
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> list = List<Widget>();

    widget.images.asMap().forEach((index, value) => {
      list.add(Positioned(
        top: 0.0,
        child: AnimatedOpacity(
          opacity: index == actual ? 1.0 : 0.0,
          duration: Duration(milliseconds: 1000),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(widget.images[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ))
    });

    return Center(
      child: Stack(
        children: list,
      ),
    );
  }
}