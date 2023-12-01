import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final String buttonText;
  final bool hasBackgroundColor;
  final VoidCallback onPressed;
  const ButtonForm(
      {Key? key,
      required this.buttonText,
      this.hasBackgroundColor = true,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(16.0)),
        backgroundColor: hasBackgroundColor
            ? MaterialStateProperty.all(const Color(0xFFFA4A0C))
            : MaterialStateProperty.all(Colors.transparent),
        elevation: hasBackgroundColor ? null : MaterialStateProperty.all(0),
        shadowColor: hasBackgroundColor
            ? null
            : MaterialStateProperty.all(Colors.transparent),
        minimumSize:
            MaterialStateProperty.all(const Size(double.infinity, 56.0)),
      ),
      onPressed: onPressed,
      child: Text(buttonText,
          style: TextStyle(
              color:
                  hasBackgroundColor ? Colors.white : const Color(0xFFFA4A0C),
              fontSize: 14.0,
              fontWeight: FontWeight.w500)),
    );
  }
}
