import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DurationType { hour, minutes, seconds }

class DurationSelector extends StatelessWidget {
  final DurationType durationType;
  const DurationSelector({
    super.key,
    required this.durationType,
  });

  String get resolveDurationSymbol {
    switch (durationType) {
      case DurationType.hour:
        return "HH";
      case DurationType.minutes:
        return "MM";
      case DurationType.seconds:
        return "SS";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("00"),
              ),
            ),
            onTap: () {
              _showDialog(
                CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32,
                  scrollController: FixedExtentScrollController(
                    initialItem: 0,
                  ),
                  onSelectedItemChanged: (int selectedItem) {
                    // setState(() {
                    //   _selectedFruit = selectedItem;
                    // });
                  },
                  children: List<Widget>.generate(
                      List.generate(60, (index) => index).length, (int index) {
                    return Center(child: Text(index.toString()));
                  }),
                ),
                context,
              );
            }),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            resolveDurationSymbol,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        )
      ],
    );
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
