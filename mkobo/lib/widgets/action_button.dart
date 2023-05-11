import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onTap,
    required this.svgName,
  });

  final Function()? onTap;
  final String svgName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: SvgPicture.asset(
          'assets/svg/$svgName.svg',
          height: 25,
          width: 25,
        ),
      ),
    );
  }
}
