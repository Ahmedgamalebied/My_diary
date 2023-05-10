import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, this.text = 'Notes', required this.icon, this.onPressed});
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const Spacer(),
        CustomSearchIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.onPressed});
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white.withOpacity(.03),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 25,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
