import 'package:flutter/material.dart';
import 'package:nike_online_shop/data/reo/auth_repositiry.dart';
import 'package:nike_online_shop/theme.dart';
import 'package:nike_online_shop/ui/root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  authRepository.loadAuthInfo;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(
        fontFamily: 'IranYekan', color: LightThemeColors.primaryTextColor);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            titleMedium: defaultTextStyle.apply(
                color: LightThemeColors.secondaryTextColor),
            bodyMedium: defaultTextStyle,
            labelLarge: defaultTextStyle,
            bodySmall: defaultTextStyle.apply(
                color: LightThemeColors.secondaryTextColor),
            titleLarge: defaultTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 18)),
        colorScheme: const ColorScheme.light(
          primary: LightThemeColors.primaryColor,
          secondary: LightThemeColors.secondaryColor,
          onSecondary: Colors.white,
        ),
      ),
      home: const Directionality(
          textDirection: TextDirection.rtl, child: RootScreen()),
    );
  }
}
