import 'package:flutter/material.dart';

class AppConfig {
  static const String assetIconPath = "assets/icons";
  static const String addIconUrl = "$assetIconPath/add_icon.svg";
  static const String soundWaveIconUrl = "$assetIconPath/sound_wave.svg";

  static const String appBarTitle = "Potato Timer";

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

  static const String appTitle = "iPotato Timer";
}
