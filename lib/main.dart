import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:magdsofttask/business_logic/bloc_observer.dart';
import 'package:magdsofttask/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsofttask/data/data_providers/local/cache_helper.dart';
import 'package:magdsofttask/data/data_providers/remote/dio_helper.dart';
import 'package:magdsofttask/presentation/router/app_router.dart';
import 'package:magdsofttask/presentation/screens/details/details_Screen.dart';
import 'package:magdsofttask/presentation/screens/details/over_view_producat/over_view_produact_screen.dart';
import 'package:magdsofttask/presentation/screens/help/help_screen.dart';
import 'package:sizer/sizer.dart';


late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () async {
      DioHelper.init();
      await CacheHelper.init();

      runApp(MyApp(
        appRouter: AppRouter(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:  (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: ((context) => GlobalCubit()..getHelpDetails()..getHomeDetails()),
            ),
          ],
          child: BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Werash',

                //home: DetailsScreen(),
                onGenerateRoute: widget.appRouter.onGenerateRoute,
                theme: ThemeData(
                  fontFamily: 'cairo',
                  appBarTheme: const AppBarTheme(
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      //statusBarColor: AppColors.transparent,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}