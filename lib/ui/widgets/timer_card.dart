import 'package:flutter/material.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "00:02:12",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: FittedBox(
                    child: IconButton.filled(
                      onPressed: () {},
                      iconSize: 28,
                      icon: Icon(Icons.play_arrow),
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 24,
                  width: 24,
                  child: FittedBox(
                    child: IconButton.filled(
                      onPressed: () {},
                      iconSize: 28,
                      icon: Icon(Icons.pause),
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "Task1",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              "This is what needs to be done and how it can be done in time",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
