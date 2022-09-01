import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/update_task/update_task.dart';
import 'package:todo_app/shared/provider/my_provider.dart';
import 'package:todo_app/shared/style/my_theme.dart';

import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        return MyProvider();
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider provid=Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (_) => HomeLayout(),
        UpdateTask.routeName:(_)=>UpdateTask()
      },
      // themeMode: ThemeMode.light,
      theme: MyTheming.lightTheme,
      darkTheme: MyTheming.darkTheme,
      themeMode: provid.themeMode,
    );
  }
}
