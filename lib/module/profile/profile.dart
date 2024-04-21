import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/controller/profile/bloc/profile_cubit.dart';
import 'package:responsive/controller/profile/bloc/profile_state.dart';
import 'package:responsive/module/profile/widget/profile_buttons.dart';
import 'package:responsive/module/profile/widget/profile_form.dart';
import 'package:responsive/module/profile/widget/profile_image.dart';
import 'package:responsive/shared/component/custom_form_field.dart';
import 'package:responsive/shared/component/custome_button.dart';
import 'package:responsive/shared/theme/color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfileDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is LoadingProfileState) {
          return Scaffold(
            backgroundColor: SharedColor.greyBackGround,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 50.h,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: const Color(0xff123456),
                  size: 40.w,
                ),
              ),
              title: Text(
                "بيانات الملف الشخصي",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.w,
                ),
              ),
              centerTitle: true,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SucessPofileState) {
          return Scaffold(
            backgroundColor: SharedColor.greyBackGround,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 50.h,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: const Color(0xff123456),
                  size: 40.w,
                ),
              ),
              title: Text(
                "بيانات الملف الشخصي",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25.w,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImageContainer(
                      imagePass: state.data["data"]["profile_photo_path"] ??
                          state.data["data"]["profile_photo_url"],
                    ),
                    ProfileForm(
                      name: state.data["data"]["name"],
                      email: state.data["data"]["email"],
                      phoneNumber: state.data["data"]["mobile"],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const PofileButtons()
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
              backgroundColor: SharedColor.greyBackGround,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 50.h,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: const Color(0xff123456),
                    size: 40.w,
                  ),
                ),
                title: Text(
                  "بيانات الملف الشخصي",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.w,
                  ),
                ),
                centerTitle: true,
              ),
              body: Center(
                child: Text(
                  "حدث مشكلة ما في تحميل الصفحة",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25.w,
                  ),
                ),
              ));
        }
      },
    );
  }
}
