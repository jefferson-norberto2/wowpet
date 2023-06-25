import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key, required this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Leitura NFC'),
      content: const Text('Aproxime o celular do chip NFC'),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            onPressed();
          },
        ),
      ],
    );
  }
}
