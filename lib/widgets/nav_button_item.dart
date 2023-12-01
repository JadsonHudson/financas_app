import 'package:flutter/material.dart';

class NavButtonItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onPressed;
  const NavButtonItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 76.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: Colors.white),
            Text(label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
