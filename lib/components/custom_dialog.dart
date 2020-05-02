import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {

  CustomDialog({this.title,this.buttonText,this.info,this.image});

  final String title, buttonText;
  final Widget info;
  final SvgPicture image;

  @override
  Widget build(BuildContext context) {

    Widget imagePositioned(BuildContext context) {
      return Positioned(
        left: 16.0,
        right: 16.0,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 66.0,
          child: SizedBox(
            width: 150,
            height: 150,
            child: image,
          ),
        ),
      );
    }

    Widget dialogContent(BuildContext context) {
      return Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 82,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            margin: const EdgeInsets.only(top: 66.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0,),
                info,
                SizedBox(height: 24.0,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ),
          imagePositioned(context),
        ],
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

