import 'package:flutter/material.dart';
import 'package:ipotato_timer/size_config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  get validatorFunction => (val) {
        if (val == null || val.isEmpty) {
          return "required";
        } else {
          return null;
        }
      };

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.outline),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(SizeConfig.smallBorderRadius),
          ),
        ),
      ),
      validator: validatorFunction,
    );
  }
}
