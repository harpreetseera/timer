import 'package:flutter/material.dart';
import 'package:timer/app_data.dart';
import 'package:timer/size_config.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;

  final int noOfLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.noOfLines = 1,
  });

  get validatorFunction => (val) {
        //Since title an description are expected to be non empty
        if (val == null || val.isEmpty) {
          return AppData.requiredText;
        } else {
          return null;
        }
      };

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: noOfLines,
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
