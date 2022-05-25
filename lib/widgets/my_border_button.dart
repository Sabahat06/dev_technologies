import 'package:flutter/material.dart';

class MyBorderButton extends StatelessWidget {
  @override
  String txt="button";
  GestureTapCallback ontap;
  Color color;
  Color borderColor;
  double leftRightpadding;
  double borderRadius;
  double width;
  double height;
  Color txtColor;
  double fontSize;

  MyBorderButton({this.borderColor ,this.txt, this.ontap,this.leftRightpadding,this.borderRadius, this.width,this.color, this.height, this.txtColor, this.fontSize});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.only(left: leftRightpadding??0,  right:leftRightpadding?? 0),
        child: InkWell(
          splashColor: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius??80.0),
          onTap: ontap,
          child: Ink(
            height: height??40,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor??Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(borderRadius??80.0),
              gradient: const LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
              ]),
            ),
            child: Center(
                child: Text(
                  txt,
                  style: TextStyle(
                      color: txtColor?? Colors.white,
                      fontSize: fontSize??18,
                      fontWeight: FontWeight.bold,
//                        fontFamily: "Sofia",
                      letterSpacing: 0.9),
                )),
          ),
        ),
      ),
    );
  }
}