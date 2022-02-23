import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onPressed;
  const DrawerItem({Key? key, required this.icon, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(width: 10,),
            Text(
              label,
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.white,fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
