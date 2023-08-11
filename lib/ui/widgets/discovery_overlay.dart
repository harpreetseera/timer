import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';

class DiscoveryOverlay extends StatelessWidget {
  final double top, right;

  const DiscoveryOverlay({super.key, required this.top, required this.right});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No timers active.\nPress here to start a new one",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SvgPicture.asset(AppConfig.directionArrowUrl),
        ],
      ),
    );
  }
}
