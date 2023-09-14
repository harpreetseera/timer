import 'package:flutter/material.dart';

class AppData {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006782),
      onPrimary: Color(0xffFFFFFF),
      primaryContainer: Color(0xffB6EAFF),
      onPrimaryContainer: Color(0xff001F2A),
      secondary: Color(0xff216C2E),
      onSecondary: Color(0xffFFFFFF),
      secondaryContainer: Color(0xffA7F5A7),
      onSecondaryContainer: Color(0xff002106),
      tertiary: Color(0xff5B5B7D),
      onTertiary: Color(0xffFFFFFF),
      tertiaryContainer: Color(0xffE1DFFF),
      onTertiaryContainer: Color(0xff181837),
      error: Color(0xffBA1B1B),
      onError: Color(0xffFFFFFF),
      errorContainer: Color(0xffFFDAD4),
      onErrorContainer: Color(0xff410001),
      background: Color(0xffFBFCFE),
      onBackground: Color(0xff191C1E),
      surface: Color(0xffFBFCFE),
      onSurface: Color(0xff191C1E),
      surfaceVariant: Color(0xffDCE4E8),
      onSurfaceVariant: Color(0xff40484C),
      outline: Color(0xff70787D),
    ),
  );

  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5FD4FD),
      onPrimary: Color(0xff003545),
      primaryContainer: Color(0xff004D62),
      onPrimaryContainer: Color(0xffB6EAFF),
      secondary: Color(0xff8BD88D),
      onSecondary: Color(0xff00390C),
      secondaryContainer: Color(0xff00390C),
      onSecondaryContainer: Color(0xffA7F5A7),
      tertiary: Color(0xffC4C3EA),
      onTertiary: Color(0xff2D2D4D),
      tertiaryContainer: Color(0xff444465),
      onTertiaryContainer: Color(0xffE1DFFF),
      error: Color(0xffFFB4A9),
      onError: Color(0xff680003),
      errorContainer: Color(0xff930006),
      onErrorContainer: Color(0xffFFDAD4),
      background: Color(0xff191C1E),
      onBackground: Color(0xffE1E3E5),
      surface: Color(0xff191C1E),
      onSurface: Color(0xffE1E3E5),
      surfaceVariant: Color(0xff40484C),
      onSurfaceVariant: Color(0xffC0C8CC),
      outline: Color(0xff8A9296),
    ),
  );

  // Path extractions for assets like icons, audio etc
  static const String assetIconPath = "assets/icons";

  static const String addIconUrl = "$assetIconPath/add_icon.svg";

  static const String soundWaveIconUrl = "$assetIconPath/sound_wave.svg";

  static const String directionArrowUrl = "$assetIconPath/direction_arrow.svg";

  static const String audioFilePath = "assets/audios/my_life.mp3";

  /// String extractions
  static const String appBarTitle = "Timer";

  static const String appTitle = "Timer";

  static const String addtasktext = "Add Task";

  static const String markCompleteText = "MARK COMPLETE";

  static const String labelText = "Title";

  static const String titleHintText = "Superdesigner";

  static const String descriptionText = "Description";

  static const String descriptionHintText = "e.g. john@gmail.com";

  static const String durationText = "Duration";

  static const String discoveryOverlayText =
      "No timers active.\nPress here to start a new one";

  static const String requiredText = "Required";

  static const String colonText = ":";

  static const String hourDenomination = "HH";

  static const String minuteDenomination = "MM";

  static const String secondDenomination = "SS";

  static const String finishedText = "FINISHED";
}
