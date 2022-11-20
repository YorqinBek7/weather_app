import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/presentation/splash_screen/splash_screen.dart';
import 'package:weather_app/utils/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(218, 471),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return AdaptiveTheme(
          builder: (ThemeData light, ThemeData dark) {
            return MaterialApp(
              theme: light,
              darkTheme: dark,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
            );
          },
          initial: AdaptiveThemeMode.system,
          light: ThemeData(
            scaffoldBackgroundColor: const Color(0xfffeebcf),
            textTheme: TextTheme(
              headline3: MyTextStyle.w600.copyWith(fontSize: 43.sp),
              headline4: MyTextStyle.w600.copyWith(fontSize: 20.sp),
              headline5: MyTextStyle.w600.copyWith(fontSize: 9.sp),
              headline6: MyTextStyle.w600.copyWith(fontSize: 7.sp),
            ),
            buttonColor: const Color(0xff000000),
            hoverColor: Colors.grey,
            selectedRowColor: Colors.black,
            disabledColor: Colors.grey,
          ),
          dark: ThemeData(
            scaffoldBackgroundColor: const Color(0xff0F4A4A),
            textTheme: TextTheme(
              headline3: MyTextStyle.w600
                  .copyWith(fontSize: 43.sp, color: Colors.white),
              headline4: MyTextStyle.w600
                  .copyWith(fontSize: 20.sp, color: Colors.white),
              headline5: MyTextStyle.w600
                  .copyWith(fontSize: 9.sp, color: Colors.white),
              headline6: MyTextStyle.w600
                  .copyWith(fontSize: 7.sp, color: Colors.white),
            ),
            buttonColor: const Color(0xffffffff),
            hoverColor: Colors.grey,
            selectedRowColor: Colors.white,
            disabledColor: Colors.grey,
          ),
        );
      },
    );
  }
}
