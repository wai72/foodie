import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/app/src/app_spacings.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../src/app_colors.dart';
import '../success/success_view.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _otpController = TextEditingController();
  late String receivedPhoneNumber;
  bool _isEnableContinue = false;
  final String _validOtp = "123456";
  Timer? _timer;
  int _remainingTime = 10;
  bool _isResend = false;
  bool _isCorrectOTP = true;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendOtp() {
    setState(() {
      _remainingTime = 10;
    });
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    receivedPhoneNumber = widget.phoneNumber;
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: const Text(
          "OTP",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.redColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "CURRENT PHONE NUMBER",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "CHANGE",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.redColor,
                    ),
                  ),
                ],
              ),
              Text(receivedPhoneNumber),
              const SizedBox(
                height: AppSpacing.xl,
              ),
              const Text(
                "PLEASE ENTER OTP",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: AppSpacing.l,
                    bottom: AppSpacing.xs,
                    left: AppSpacing.s),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.strokeColor, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: PinCodeTextField(
                        controller: _otpController,
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        mainAxisAlignment: MainAxisAlignment.start,
                        appContext: context,
                        pinTheme: PinTheme(
                            activeColor: AppColors.whiteColor,
                            inactiveColor: AppColors.strokeColor,
                            selectedColor: AppColors.strokeColor,
                            fieldHeight: 20,
                            fieldOuterPadding:
                                const EdgeInsets.only(right: AppSpacing.xs),
                            fieldWidth: 15),
                        length: 6,
                        validator: (otp) {
                          if (otp == _validOtp) {
                            _isEnableContinue = true;
                            _isCorrectOTP = true;
                          } else {
                            _isCorrectOTP = false;
                          }
                        },
                      ),
                    ),
                    if (_isResend && _remainingTime > 0)
                      Padding(
                          padding: const EdgeInsets.only(right: AppSpacing.s),
                          child: Text(
                            "${_remainingTime}s",
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ))
                  ],
                ),
              ),
              const SizedBox(
                height: AppSpacing.xs,
              ),
              if ((!_isResend &&_isCorrectOTP)||(!_isEnableContinue))
                InkWell(
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "Didn't received?",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      TextSpan(
                        text: "Resend",
                        style: TextStyle(color: AppColors.linkColor),
                      )
                    ]),
                  ),
                  onTap: () {
                    setState(() {
                      _isResend = true;
                      _startTimer();
                    });
                  },
                ),
              if (!_isCorrectOTP)
                InkWell(
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "Wrong OTP.",
                        style: TextStyle(color: AppColors.textColor),
                      ),
                      TextSpan(
                        text: "TryAgain",
                        style: TextStyle(color: AppColors.linkColor),
                      )
                    ]),
                  ),
                  onTap: () {
                    setState(() {
                      _otpController.clear();
                    });
                  },
                ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isEnableContinue
                        ? AppColors.redColor
                        : AppColors.strokeColor,
                  ),
                  onPressed: _isEnableContinue
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SuccessView(),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
