import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.icon, required this.text,this.color})
      : super(key: key);
  final IconData icon;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 60,
          width: 70,
          decoration: BoxDecoration(
              color: color?? Theme.of(context).backgroundColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white60),
        )
      ],
    );
  }
}
