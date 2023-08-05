import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTaskOverlay extends StatelessWidget {
  const AddTaskOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: Text('Add Task'),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      actions: [
        MaterialButton(
          minWidth: double.maxFinite,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Add Task"),
          ),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Title",
                      hintText: "Superdesigner",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.outline),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "e.g. john@gmail.com",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.outline),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Duration",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          child: Text("00"),
                          onTap: () {
                            _showDialog(
                              CupertinoPicker(
                                magnification: 1.22,
                                squeeze: 1.2,
                                useMagnifier: true,
                                itemExtent: 32,
                                // This sets the initial item.
                                scrollController: FixedExtentScrollController(
                                  initialItem: 0,
                                ),
                                // This is called when selected item is changed.
                                onSelectedItemChanged: (int selectedItem) {
                                  // setState(() {
                                  //   _selectedFruit = selectedItem;
                                  // });
                                },
                                children: List<Widget>.generate(
                                    List.generate(60, (index) => index).length,
                                    (int index) {
                                  return Center(child: Text(index.toString()));
                                }),
                              ),
                              context,
                            );
                          }),
                      // Flex(
                      //   direction: Axis.horizontal,
                      //   children: [
                      //     SizedBox(
                      //       width: 50,
                      //       child: Flexible(
                      //         flex: 1,
                      //         child: TextFormField(
                      //             expands: false,
                      //             maxLines: 1,
                      //             keyboardType: TextInputType.number,
                      //             decoration: InputDecoration(
                      //               hintText: "00",
                      //               filled: true,
                      //               fillColor: Theme.of(context)
                      //                   .colorScheme
                      //                   .secondaryContainer,
                      //               border: InputBorder.none,
                      //             ),
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(2),
                      //             ]),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 50,
                      //       child: Flexible(
                      //         flex: 1,
                      //         child: TextFormField(
                      //           expands: false,
                      //           maxLines: 1,
                      //           keyboardType: TextInputType.number,
                      //           decoration: InputDecoration(
                      //             hintText: "00",
                      //             border: InputBorder.none,
                      //           ),
                      //           inputFormatters: [
                      //             LengthLimitingTextInputFormatter(2),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // SizedBox(
                      //   width: 30,
                      //   child: Flexible(
                      //     child: TextFormField(
                      //       maxLength: 2,
                      //       decoration: InputDecoration(hintText: "00"),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
