import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/material.dart' as material show TextField;
import 'package:pokedex/src/presentation/design_system/tokens.dart';

import 'inner_shadow.dart';

class TextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onIconTap;
  final ValueChanged<String>? onSubmit;
  final IconData? icon;
  final String? hint;
  final String? initialText;

  const TextField({
    super.key,
    this.onChanged,
    this.onIconTap,
    this.onSubmit,
    this.icon,
    this.hint,
    this.initialText,
  });

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  late final controller = TextEditingController(text: widget.initialText);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var fontSize = theme.inputDecorationTheme.hintStyle?.fontSize;

    if (fontSize != null && fontSize > 0) {
      final textScaleFactor = MediaQuery.of(context).textScaleFactor;

      fontSize *= textScaleFactor < 1 ? 1 : textScaleFactor;
    }

    return InnerShadow(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      shadow: smallShadow,
      child: material.TextField(
        controller: controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmit,
        decoration: InputDecoration(
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          hintText: widget.hint,
        ),
      ),
    );
  }
}
