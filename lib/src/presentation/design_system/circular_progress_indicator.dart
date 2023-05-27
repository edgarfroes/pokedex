import 'package:flutter/material.dart' hide CircularProgressIndicator;
import 'package:flutter/material.dart' as material
    show CircularProgressIndicator;

class CircularProgressIndicator extends StatelessWidget {
  const CircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: material.CircularProgressIndicator(),
    );
  }
}
