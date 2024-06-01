import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive/controller/login/bloc/cubit.dart';
import 'package:responsive/controller/login/bloc/state.dart';
import 'package:responsive/module/code_screen.dart';
import 'package:responsive/module/home_screen.dart';
import 'package:responsive/module/signup_screen.dart';
import 'package:responsive/shared/component/custom_form_field.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/component/custome_button.dart';
import 'package:responsive/shared/theme/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var hiveBox = Hive.box<String>("my_token");
  @override
  Widget build(BuildContext context) {
    var widthOnly = MediaQuery.of(context).size.width;

    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(right: widthOnly * (20 / widthOnly)),
            child: Icon(
              Icons.save,
              color: SharedColor.greyColor,
              size: width * (40 / width),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: width * (10 / width)),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: SharedColor.greyColor,
                  size: width * (40 / width),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widthOnly * (10 / widthOnly)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height * 0.25,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Capture2.PNG"))),
                  ),
                  SizedBox(
                    height: height * (25 / height),
                  ),
                  custamTextFormField(
                      borderColor: SharedColor.greyColor,
                      labelText: "عنوان البريد الالكتروني",
                      hintText: "ادخل البريد الالكتروني",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال البريد الالكتروني';
                        }
                        return null;
                      },
                      controller: _usernameController),
                  SizedBox(
                    height: height * (25 / height),
                  ),
                  custamTextFormField(
                      borderColor: SharedColor.greyColor,
                      labelText: "كلمة المرور",
                      hintText: "ادخل كلمة المرور",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال كلمة المرور';
                        }
                        return null;
                      },
                      controller: _passwordController),
                  SizedBox(
                    height: 25.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CodeScreen(),
                      ));
                    },
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: customText(
                          fontWeight: FontWeight.w600,
                          text: "هل نسيت كلمة المرور؟",
                          color: SharedColor.blackColor,
                          fontSize: 20.sp),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  custamButtom(
                      color: SharedColor.greenColor,
                      text: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: customText(
                            text: "تسجيل الدخول",
                            color: SharedColor.whiteColor,
                            fontSize: 20.sp),
                      ),
                      paddingHersontal: 130.w,
                      paddingVertical: 15.h,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await BlocProvider.of<LoginCubit>(context)
                              .postLoginData(data: {
                            "phone_email": _usernameController.text,
                            "password": _passwordController.text
                          });
                          if (state is LoginLoadingState) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return object of type Dialog
                                return SizedBox(
                                  height: 100.h,
                                  width: 100.w,
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                            );
                          } else if (state is LoginSuccesState) {
                            if (state.data["status"] == true) {
                              hiveBox
                                  .put("token", state.data["data"]["token"])
                                  .then((value) => print(hiveBox.get("token")));
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return AlertDialog(
                                    content: Text(
                                      state.data["message"],
                                      style: const TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 15,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      // usually buttons at the bottom of the dialog
                                      TextButton(
                                        child: const Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        }
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                          },
                          child: InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            )),
                            child: customText(
                                fontWeight: FontWeight.w600,
                                text: "ليس لديك حساب؟",
                                color: SharedColor.blackColor,
                                fontSize: 20.sp),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                          },
                          child: Row(
                            children: [
                              customText(
                                  fontWeight: FontWeight.w600,
                                  text: "أنشى حساب",
                                  color: SharedColor.blackColor,
                                  fontSize: 20.sp),
                              Icon(
                                Icons.arrow_right,
                                size: 35.w,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
