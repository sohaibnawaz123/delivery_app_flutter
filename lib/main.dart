import 'package:delivery_app/instance.dart' show getInstance;
import 'package:delivery_app/modules/onboarding/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:delivery_app/modules/onboarding/presentation/routes/onboarding_view_initial_params.dart';
import 'package:delivery_app/modules/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

late GetIt getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt = GetIt.instance;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    getInstance(context);
    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ScreenUtilInit(
        designSize: const Size(402, 871),

        child: OnboardingView(
          bloc: getIt<OnboardingBloc>(param1: OnboardingViewInitialParams()),
        ),
      ),
    );
  }
}
