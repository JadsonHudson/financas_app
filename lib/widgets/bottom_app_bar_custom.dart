import 'package:financas_app/widgets/nav_button_item.dart';
import 'package:flutter/material.dart';

class BottomAppBarCustom extends StatefulWidget {
  const BottomAppBarCustom({Key? key}) : super(key: key);

  @override
  State<BottomAppBarCustom> createState() => _BottomAppBarCustomState();
}

class _BottomAppBarCustomState extends State<BottomAppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 64.0,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      color: const Color(0xFF37343b),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavButtonItem(
                label: "Home",
                icon: Icons.home,
                onPressed: () => {
                      Navigator.popUntil(context, ModalRoute.withName('/HomePage'))
                    }),
            NavButtonItem(
                label: "Transações", icon: Icons.list, onPressed: () => {}),
            const SizedBox(width: 32),
            NavButtonItem(
                label: "Planejamento", icon: Icons.flag, onPressed: () => {}),
            NavButtonItem(
                label: "Outros", icon: Icons.more_horiz, onPressed: () => {})
          ],
        ),
      ),
    );
  }
}
