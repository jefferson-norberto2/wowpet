import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wowpet/app/config/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecrect;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final double? padding_bottom;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecrect = false,
    this.inputFormatters,
    this.keyboardType,
    this.padding_bottom,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.isSecrect;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding_bottom != null
          ? EdgeInsets.only(bottom: widget.padding_bottom as double)
          : const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          focusColor: CustomColors.customPrimaryColor,
          suffixIcon: widget.isSecrect
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          label: Text(widget.label),
          prefixIcon: Icon(widget.icon),
          isDense: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
