import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive/controller/login/bloc/cubit.dart';
import 'package:responsive/controller/login/repo/login_repo_impl.dart';

import 'package:responsive/controller/register/bloc/cubit.dart';
import 'package:responsive/controller/register/repo/register_repo_implr.dart';
import 'package:responsive/module/profile/profile.dart';

import 'package:responsive/module/splach_screen.dart';

import 'shared/locator.dart';

void main() {
  setUp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      child: const ProfileScreen(),
    );
  }
}
