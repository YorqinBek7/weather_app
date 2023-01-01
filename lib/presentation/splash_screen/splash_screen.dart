import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/presentation/home_screen/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  late LocationData _locationData;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    await Future.delayed(const Duration(seconds: 3), () {
      if (_locationData != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                lat: _locationData.latitude!,
                lon: _locationData.longitude!,
              ),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Brightness.dark),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Lottie.asset("assets/lottie/weather.json",
            width: 200.w, height: 200.h),
      ),
    );
  }
}
