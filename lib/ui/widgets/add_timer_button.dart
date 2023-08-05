import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/size_config.dart';

class AddTimerButton extends StatelessWidget {
  const AddTimerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: const CircleBorder(),
      child: SvgPicture.asset(
        AppConfig.addIconUrl,
        width: SizeConfig.addIconSize,
        height: SizeConfig.addIconSize,
      ),
    );
  }
}
