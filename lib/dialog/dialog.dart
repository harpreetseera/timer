import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Custom dialog to show cupertino modal popup.
/// Any child passed to it is disaplayed in a cupertino modal popup
class CustomDialog {
  static void showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
