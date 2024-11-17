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
  late String receivedPhoneNumber;
  bool _isEnableContinue = false;
  final TextEditingController _otpController = TextEditingController();
  final String _validOtp = "123456";
  String _statusMessage = "";

// For demonstration; in real scenarios, this comes from backend.

  void _checkOtp(String otp) {
    setState(() {
      if (otp == _validOtp) {
        _statusMessage = "OTP Verified Successfully!";
        _isEnableContinue = true;
      } else {
        _statusMessage = "Invalid OTP. Please try again.";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    receivedPhoneNumber = widget.phoneNumber;
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
                    top: AppSpacing.l, bottom:AppSpacing.xs,left: AppSpacing.s),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.strokeColor, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: PinCodeTextField(
                  textStyle:  TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
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
                      _statusMessage = "OTP Verified Successfully!";
                      _isEnableContinue = true;
                    } else {
                      _statusMessage = "Invalid OTP. Please try again.";
                    }
                  },
                ),
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
