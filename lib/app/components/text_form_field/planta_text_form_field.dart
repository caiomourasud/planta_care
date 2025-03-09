import 'package:flutter/material.dart';

class PlantaTextFormField extends TextFormField {
  PlantaTextFormField({
    required BuildContext context,
    required String hintText,
    Widget? prefixIcon,
    super.readOnly = false,
    super.validator,
    super.onChanged,
    super.controller,
    super.autocorrect,
    super.obscureText,
    super.autovalidateMode,
    super.keyboardType,
    super.textInputAction,
    super.textCapitalization,
    super.maxLines,
    super.minLines,
    super.expands,
    super.maxLength,
    super.maxLengthEnforcement,
    super.onTap,
    super.key,
  }) : super(
          style: Theme.of(context).textTheme.bodyMedium,
          obscuringCharacter: '●',
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(25),
              ),
            ),
          ),
        );
}
