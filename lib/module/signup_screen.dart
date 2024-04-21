import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/controller/register/bloc/cubit.dart';
import 'package:responsive/controller/register/bloc/state.dart';
import 'package:responsive/module/login_screen.dart';
import 'package:responsive/shared/component/custom_form_field.dart';
import 'package:responsive/shared/component/custom_text.dart';
import 'package:responsive/shared/component/custome_button.dart';
import 'package:responsive/shared/theme/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthOnly = MediaQuery.of(context).size.width;

    var width = MediaQuery.of(context).orientation == Orientation.portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is SucessRegisterState) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      } else if (state is FailureRegisterState) {
        showDialogMethod(
          context: context,
          content: const Text(
            "هذه البيانات موجودة من قبل",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 15,
            ),
          ),
          actions: [
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
        /* showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              content: const Text(
                "هذه البيانات موجودة من قبل",
                style: TextStyle(
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
        ); */
      } else if (state is LoadinRegisterState) {
        showDialogMethod(
            context: context,
            content: const Center(
              child: Card(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ));
        /*  showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return const AlertDialog(
                content: Center(
              child: CircularProgressIndicator(),
            ));
          },
        ); */
      }
    }, builder: (context, state) {
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
                  size: 40.w,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: widthOnly * (10 / widthOnly)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height * (25 / height),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: customText(
                        text: "إنشاء حساب جديد",
                        color: SharedColor.blackColor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: customText(
                        text: "أدخل بياناتك لإنشاء حساب",
                        color: SharedColor.greyColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  custamTextFormField(
                      borderColor: SharedColor.greyColor,
                      labelText: "الاسم",
                      hintText: "ادخل الاسم",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "يجب ادخال اسم المستخدم";
                        }
                        return null;
                      },
                      controller: _usernameController),
                  SizedBox(
                    height: 15.h,
                  ),
                  custamTextFormField(
                      borderColor: SharedColor.greyColor,
                      labelText: "رقم الهاتف",
                      hintText: "ادخل رقم الهاتف",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال رقم الهاتف';
                        }
                        return null;
                      },
                      controller: _mobileController),
                  SizedBox(
                    height: 15.h,
                  ),
                  custamTextFormField(
                      borderColor: SharedColor.greyColor,
                      labelText: "عنوان البريد الالكتروني",
                      hintText: "ادخل البريد الالكتروني",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال البريد الالكتروني الخاص';
                        } else {
                          if (value.contains("@") == false) {
                            return 'البريد الالكتروني يحتوي علي حرف @';
                          }
                        }
                        return null;
                      },
                      controller: _emailController),
                  SizedBox(
                    height: 15.h,
                  ),
                  custamTextFormField(
                      borderColor: SharedColor.greyColor,
                      labelText: "كلمة المرور",
                      hintText: "ادخل كلمة المرور",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "يجب ادخال كلمة المرور";
                        } else {
                          if (value.length < 6) {
                            return "يجب كلمة المرور الا تقل عن 6 احرف";
                          }
                        }
                        return null;
                      },
                      controller: _passwordController),
                  SizedBox(
                    height: 25.h,
                  ),
                  custamTextFormField(
                    borderColor: SharedColor.greyColor,
                    labelText: "تاكيد كلمة المرور",
                    hintText: "ادخل كلمة المرور",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يجب ادخال تأكيد كلمة المرو";
                      } else {
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          return "يجب ادخال نفس كلمة المرور";
                        }
                      }
                      return null;
                    },
                    controller: _confirmPasswordController,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  custamButtom(
                    color: SharedColor.greenColor,
                    radius: 15.r,
                    text: customText(
                        text: "اشتراك",
                        color: SharedColor.whiteColor,
                        fontSize: 20.w),
                    paddingHersontal: 150.w,
                    paddingVertical: 15.h,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await BlocProvider.of<RegisterCubit>(context)
                            .postDataRegiter(data: {
                          "name": _usernameController.text,
                          "mobile": _mobileController.text,
                          "email": _emailController.text,
                          "password": _passwordController.text,
                          "c_password": _confirmPasswordController.text,
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 25.sp,
                  ),
                  InkWell(
                    onTap: () {},
                    child: customText(
                        fontWeight: FontWeight.w600,
                        text: "أو اشترك مع",
                        color: SharedColor.blackColor,
                        fontSize: 25.sp),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        containerWithImage(
                            pass: "assets/facebook.PNG",
                            width: 195.w,
                            height: 150.h),
                        containerWithImage(
                            pass: "assets/google.PNG",
                            width: 195.w,
                            height: 150.h)
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                          },
                          child: customText(
                              fontWeight: FontWeight.w600,
                              text: "لديك حساب بالفعل؟",
                              color: SharedColor.blackColor,
                              fontSize: 20.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                          },
                          child: Row(
                            children: [
                              customText(
                                  fontWeight: FontWeight.w600,
                                  text: "تسجيل الدخول",
                                  color: SharedColor.blackColor,
                                  fontSize: 20.sp),
                              Icon(
                                Icons.arrow_right,
                                size: width * (35 / width),
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

Widget containerWithImage(
    {required String pass, required double width, required double height}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(pass), fit: BoxFit.fitWidth)),
  );
}

Future showDialogMethod(
    {required BuildContext context,
    required Widget content,
    List<Widget>? actions}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(content: content, actions: actions);
    },
  );
}
