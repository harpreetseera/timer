import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';

class FinishedBanner extends StatelessWidget {
  const FinishedBanner({super.key});

  get sounWaveIcon => SvgPicture.asset(AppData.soundWaveIconUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sounWaveIcon,
          Text(
            "FINISHED",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          sounWaveIcon,
        ],
      ),
    );
  }
}
