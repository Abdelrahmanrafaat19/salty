import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/controller/profile/bloc/change_password_bloc/change_password_cubit.dart';
import 'package:responsive/shared/theme/color.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ChangePasswordCubit>(context).changePasswordMethod({
        "old_password": _oldPasswordController.text,
        "new_password": _newPasswordController.text,
        "c_password": _confirmNewPasswordController.text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordIsLoading) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: SizedBox(
                width: 100.w,
                height: 100.h,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: SharedColor.frgreen,
                  ),
                ),
              ),
            ),
          );
        } else if (state is ChangePasswordSuccess) {
          if (state.data["status"] == true) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تغير كلمة المرور')),
            );
          } else {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.data["message"])),
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            centerTitle: true,
            title: const Text('تغير كلمة المرور'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _oldPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'كلمة المرور القديمة'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاء ادخل كلمة المرور الخاص بيك';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _newPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'كلمة المرور الجديدة'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'رجاء ادخل كلمة المرور الجديدة';
                        } else if (value.length < 6) {
                          return 'يجب ان الا تقل كلمة المرور عن 6 احرف ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _confirmNewPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'تاكيد كلمة المرور الجديدة'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يجب ادخال تأكيد كلمة المرور الجديدة';
                        } else if (value != _newPasswordController.text) {
                          return 'كلمة المرور لا تساوي كلمة المرور الجديدة';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    Center(
                      child: ElevatedButton(
                        onPressed: _changePassword,
                        child: const Text('تغير كلمة المرور '),
                      ),
                    ),
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
