import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BasicAppBar extends StatelessWidget with PreferredSizeWidget {

  BasicAppBar({this.title});
  final Text title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: title,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}