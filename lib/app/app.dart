import 'package:flutter/material.dart';
import 'package:todo_riverpod/core/theme/app_theme.dart';
import 'package:todo_riverpod/features/todo/presentation/screens/todo_screen.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.themeData,
      home: TodoScreen()
    );
  }
}