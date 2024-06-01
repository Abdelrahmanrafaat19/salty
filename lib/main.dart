import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive/controller/cart/cart_model/cart_model.dart';
import 'package:responsive/controller/login/bloc/cubit.dart';
import 'package:responsive/controller/login/repo/login_repo_impl.dart';
import 'package:responsive/controller/product/product_cubit/product_cubit.dart';
import 'package:responsive/controller/product/product_repo/product_repo_imple.dart';
import 'package:responsive/controller/profile/bloc/change_password_bloc/change_password_cubit.dart';
import 'package:responsive/controller/profile/bloc/profile_cubit.dart';
import 'package:responsive/controller/profile/repo/change_password_repo/change_password_Repo_imple.dart';
import 'package:responsive/controller/profile/repo/profile_repo_imple.dart';
import 'package:responsive/controller/register/bloc/cubit.dart';
import 'package:responsive/controller/register/repo/register_repo_implr.dart';
import 'package:responsive/module/home_screen.dart';
import 'package:responsive/module/login_screen.dart';
import 'shared/locator.dart';

void main() async {
  setUp();
  await Hive.initFlutter("my_token");
  Hive.registerAdapter(CartProductDataAdapter());
  await Hive.openBox<CartProductData>("cart_box").then(
    (value) => debugPrint("The CartBox is Created"),
  );
  await Hive.openBox<String>("my_token").then(
    (value) => debugPrint("The My_Token is Created"),
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
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
            ),
            BlocProvider(
              create: (context) => ChangePasswordCubit(
                getit.get<ChangePasswordRepoImple>(),
              ),
            ),
            BlocProvider(
              create: (context) => ProductCubit(
                getit.get<ProductRepoImple>(),
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
      child: hiveBox.get("token") == null
          ? const LoginScreen()
          : const HomeScreen(),
    );
  }
}
