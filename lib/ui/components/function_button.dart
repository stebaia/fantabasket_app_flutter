import 'package:flutter/material.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton(
      {super.key,
      this.loading = false,
      this.onPressed,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      this.width});

  final bool loading;
  final GestureTapCallback? onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(6))),
          width: width ?? MediaQuery.of(context).size.width,
          child: Center(
              child: !loading
                  ? Text(
                      text,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PublicSansBold'),
                    )
                  : SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: textColor),
                    )),
        ));
  }
}
