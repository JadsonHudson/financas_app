import 'package:flutter/material.dart';

class MenuButtonItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
final Color color;
  const MenuButtonItem({Key? key,  required this.icon, required this.label, required this.onTap, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color( 0xff4B4B53),
            shadowColor: Colors.transparent,
            elevation: 0,
            padding: const EdgeInsets.all(16),
            shape: const CircleBorder(),
          ),
          onPressed: onTap,
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
