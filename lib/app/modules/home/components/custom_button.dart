import 'package:flutter/material.dart';
import '../../../config/custom_colors.dart';

class CustomButton extends StatefulWidget {
  final IconData? icon;
  final String text;
  final Function()? onPressed;
  final double? height;
  final String? imagePath;

  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    this.onPressed,
    this.height,
    this.imagePath,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.customPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon != null ? Icon(widget.icon) : const SizedBox(),
            widget.imagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height:
                          widget.height != null ? widget.height! * 0.85 : 40,
                      width: widget.height != null ? widget.height! * 0.85 : 40,
                      child: Image.asset(widget.imagePath!),
                    ),
                  )
                : const SizedBox(),
            widget.icon != null || widget.imagePath != null
                ? const SizedBox(width: 30)
                : const SizedBox(),
            Text(
              widget.text,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
