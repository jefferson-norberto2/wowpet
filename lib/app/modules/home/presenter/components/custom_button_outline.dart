import 'package:flutter/material.dart';
import '../../../../config/custom_colors.dart';

class CustomButtonOutline extends StatefulWidget {
  final IconData? icon;
  final String text;
  final Function()? onPressed;

  const CustomButtonOutline(
      {super.key, this.icon, required this.text, this.onPressed});

  @override
  State<CustomButtonOutline> createState() => _CustomButtonOutlineState();
}

class _CustomButtonOutlineState extends State<CustomButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: CustomColors.customPrimaryColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: widget.icon != null
                    ? Icon(widget.icon, color: CustomColors.customPrimaryColor)
                    : const Placeholder()),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 15, color: CustomColors.customPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
