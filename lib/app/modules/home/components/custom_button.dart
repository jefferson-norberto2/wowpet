import 'package:flutter/material.dart';
import '../../../config/custom_colors.dart';

class CustomButton extends StatefulWidget {
  final IconData? icon;
  final String text;
  final Function()? onPressed;
  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.customPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
