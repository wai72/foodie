import 'package:flutter/material.dart';

import '../../src/app_colors.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text(
          "OTP",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.redColor,
      ),
    );
  }
}
