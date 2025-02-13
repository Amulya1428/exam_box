import 'package:exam_box/Screens/create_profile.dart';
import 'package:exam_box/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'login_screen.dart';

class SignUpOtpScreen extends StatefulWidget {
  const SignUpOtpScreen({super.key});

  @override
  State<SignUpOtpScreen> createState() => _SignUpOtpScreenState();
}

bool _isObscure = true;

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: tGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 90,
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/icon 1.png'),
              SizedBox(
                width: 10,
              ),
              Text(
                "SIGN UP",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: PrimaryColor),
              )
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: White,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [tBoxShadow]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OTP Verification',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 23,
                        ),
                        child: PinCodeTextField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                            LengthLimitingTextInputFormatter(4),
                          ],
                          //backgroundColor: Colors.white,
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Black,
                            fontWeight: FontWeight.bold,
                          ),
                          textStyle: TextStyle(fontSize: 15),
                          length: 4,
                          obscureText: false,
                          obscuringCharacter: '*',

                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 4 || v.length == 0) {
                              return "otp_length_did_not_match";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            borderWidth: 0,
                            shape: PinCodeFieldShape.box,
                            activeColor: Colors
                                .transparent,
                            selectedColor: Colors
                                .transparent, 
                            inactiveColor: Colors
                                .transparent, 
                            selectedFillColor: Color.fromRGBO(38, 97, 27, 0.1),
                            inactiveFillColor: Color.fromRGBO(38, 97, 27, 0.1),
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 60,
                            fieldWidth: 60,
                            activeFillColor:  Color.fromRGBO(38, 97, 27, 0.1),
                          ),
                          cursorColor: Colors.black,
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          //errorAnimationController: errorController,
                          // controller: _otpCodeController,
                          keyboardType: TextInputType.number,
                          // boxShadows: [tBoxShadow],
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onTap: () {
                            print("Pressed");
                          },
                          onChanged: (value) {
                            print(value);
                            
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");

                            return true;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Resend",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Black,
                                  fontWeight: FontWeight.w500),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: " 00:30",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: PrimaryColor,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            boxShadow: [BoxShadow(color: Colors.black)],
                            borderRadius: BorderRadius.circular(8)),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateProfileScreen()),
                            );
                          },
                          style: TextButton.styleFrom(
                              fixedSize: Size(
                                double.maxFinite,
                                20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  14.00,
                                ),
                              )),
                          child: Text(
                            "Verify OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
