import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsofttask/presentation/screens/help/help_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../../data/models/account_model.dart';
import '../details/details_Screen.dart';

class Otp extends StatefulWidget {

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String uid = "";
   String otpRegister ='';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        var cubit = GlobalCubit.get(context);

        if (state is OtpSuccessState){
          if (otpRegister==cubit.registerModel?.code) {
            Fluttertoast.showToast(
              msg:
              "${cubit.otpModel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpScreen(),
              ),
            );
          }else {
            Fluttertoast.showToast(
              msg:
              "${cubit.otpModel?.message}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              decoration:const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff0062BD),
                        Colors.white,
                      ],
                      stops: [0.1, 0.5]
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Verify Phone",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w400

                      ),
                    ),
                    const SizedBox(height: 60,),
                    Visibility(
                      child: OTPTextField(
                        onCompleted: (pin) {
                          setState(() {
                            otpRegister = pin;

                          });
                        },
                        length: 4,
                        width: double.infinity,
                        fieldWidth: 50,
                        style:const TextStyle(
                            fontSize: 17,
                            color: Colors.black
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                      ),
                      visible: true,
                    ),
                    const SizedBox(height: 100,),
                    InkWell(onTap: (){},
                      child: const Text(
                        "Resend Code",
                        style: TextStyle(
                          color: Color(0xff0062BD),
                          fontSize: 20,

                        ),
                      ),
                    ),
                    const SizedBox(height: 80,),
                    GestureDetector(
                      onTap: () {

                        cubit.otpDetails(
                            code: otpRegister,
                            phone: cubit.phoneController.text);

                      },
                      child: Container(
                        height: 57,
                        width: 343,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  const Color(0xff0062BD),
                                  Colors.lightBlue.shade600
                                ],
                                stops: [.3, 6]
                            )
                        ),
                        child: const Center(
                          child: Text(
                            'Verify',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                        ),


                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}