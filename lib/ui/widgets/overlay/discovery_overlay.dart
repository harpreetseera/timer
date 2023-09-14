import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer/app_data.dart';

///Discovery overlay displayed above the AddTimer button to guide user
class DiscoveryOverlay extends StatelessWidget {
  final double top, right;

  const DiscoveryOverlay({super.key, required this.top, required this.right});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              AppData.discoveryOverlayText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  AppData.directionArrowUrl,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .colorScheme
                        .tertiaryContainer
                        .withOpacity(0.6),
                    BlendMode.srcIn,
                  ),
                ),
                Positioned(
                  left: 5.0,
                  bottom: 3,
                  child: SvgPicture.asset(
                    AppData.directionArrowUrl,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context)
                          .colorScheme
                          .onTertiaryContainer
                          .withOpacity(0.6),
                      BlendMode.srcIn,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
