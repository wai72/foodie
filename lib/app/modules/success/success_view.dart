import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/app/src/app_spacings.dart';

import '../../src/app_colors.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({super.key});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Success",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.redColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/icon_success.svg",
              width: 72,
              height: 72,
            ),
            const SizedBox(
              height: AppSpacing.xl,
            ),
            const Text(
              "Your order is received.",
            ),
            const Text("We will contact you shortly."),
            const SizedBox(
              height: AppSpacing.xl,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.redColor,
                side: const BorderSide(width: 1, color: AppColors.redColor),
              ),
              child: const Text("BACK TO HOME"),
            )
          ],
        ),
      ),
    );
  }
}
