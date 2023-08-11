import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_data.dart';

class FinishedBanner extends StatelessWidget {
  const FinishedBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final sounWaveIcon = SvgPicture.asset(
      AppData.soundWaveIconUrl,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          sounWaveIcon,
          Text(
            AppData.finishedText,
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
