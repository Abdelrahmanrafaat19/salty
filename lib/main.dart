import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive/controller/login/bloc/cubit.dart';
import 'package:responsive/controller/login/repo/login_repo_impl.dart';
import 'package:responsive/controller/profile/bloc/profile_cubit.dart';
import 'package:responsive/controller/profile/repo/profile_repo_imple.dart';

import 'package:responsive/controller/register/bloc/cubit.dart';
import 'package:responsive/controller/register/repo/register_repo_implr.dart';
import 'package:responsive/module/login_screen.dart';

import 'module/edit_profile/edit_profile.dart';
import 'shared/locator.dart';

void main() async {
  setUp();
  await Hive.initFlutter("my_token");
  await Hive.openBox<String>("my_token").then(
    (value) => debugPrint("The My_Token is Created"),
  );
  runApp(
    MyApp(),
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  var hiveBox = Hive.box<String>("my_token");
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  RegisterCubit(getit.get<RegisterRepoImple>()),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                getit.get<LoginRepoImplement>(),
              ),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(
                getit.get<ProfileRepoImpl>(),
              ),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: const Locale('ar', 'AR'), // Set the locale to Arabic
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'AR'), // Arabi
            ],
            home: child,
          ),
        );
      },
      child:
          const LoginScreen() /* hiveBox.get("token") == null
          ? const SplachScreen()
          : const HomeScreen() */
      ,
    );
  }
}
