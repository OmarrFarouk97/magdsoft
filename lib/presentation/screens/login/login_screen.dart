import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../business_logic/global_cubit/global_cubit.dart';
import '../../componant/my_form.dart';
import '../otp/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  bool otpVisibility = false;
  String verificationID = "";
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        var cubit = GlobalCubit.get(context);


        if ( state is RegisterSuccessState ){

          Fluttertoast.showToast(
            msg:
            "Your code is ${cubit.registerModel!.code}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(),
            ),
          );


        }
      },
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);

        return SafeArea(
            child: Scaffold(
                body: SingleChildScrollView(
          child: Stack(children: [
            const SizedBox(
              width: double.infinity,
              height: 386,
              child: Image(
                image: AssetImage('assets/images/22.png'),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 310),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60))),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 250.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 1,
                              width: 165,
                              color: Color(0xff639FD7),
                            ),
                            const Text('Or',
                                style: TextStyle(
                                    color: Color(0xff0062BD), fontSize: 15)),
                            Container(
                              height: 1,
                              width: 165,
                              color: Color(0xff639FD7),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage(
                                  'assets/images/facebook.png',
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage('assets/images/ios 1.png'),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage('assets/images/Google.png'),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 193.0, horizontal: 20),
              child: Container(
                  width: 372,
                  height: 345,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    'Welcome',
                                    style: TextStyle(
                                        fontSize: 30, color: Color(0xff464646)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 3.13,
                                  width: 143,
                                  color: Color(0xff0061bc),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MyForm(
                                  controller: cubit.nameController,
                                  label: 'Enter your Full Name',
                                  type: TextInputType.text,
                                  radius: 15.0,
                                  validation: 'Email must not be empty',
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  height: 70,
                                  width: 282,
                                  child: TextFormField(
                                    controller: cubit.phoneController,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Phone number must not be empty';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      hintText: 'Eg. 01552468326',
                                      prefixIcon: CountryCodePicker(
                                        onChanged: print,
                                        initialSelection: 'EG',
                                        favorite: const ['+20', 'EG'],
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        alignLeft: false,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.userRegister(
                                        name: cubit.nameController.text,
                                        phone: cubit.phoneController.text,
                                      );

                                    }


                                  },
                                  child: Container(
                                    height: 48,
                                    width: 282,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              const Color(0xff0062BD),
                                              Colors.lightBlue.shade600
                                            ],
                                            stops: [
                                              .3,
                                              6
                                            ])),
                                    child: const Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ]),
        )));
      },
    );
  }
}

