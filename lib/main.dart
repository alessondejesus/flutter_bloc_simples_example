import 'package:estudo_flutter/bloc/users/user_bloc.dart';
import 'package:estudo_flutter/bloc/users/user_model.dart';
import 'package:estudo_flutter/screens/users/users_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print("${bloc.runtimeType} >  $change");
    super.onChange(bloc, change);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GLOBAL OBSERVER LOG
    Bloc.observer = LogObserver();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('testando bloc'),
            ),
            body: const UsersListScreen(),
          ),
        );
      },
    );
  }
}
