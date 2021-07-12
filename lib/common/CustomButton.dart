import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.text, this.onPressed, this.loading});

  final String text;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: Size.infinite.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: loading
            ? CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        )
            : Text(
          text,
        ),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
