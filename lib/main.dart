import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/di/locator.dart';
import 'package:todo_app/features/home_page/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/home_page/presentation/screens/home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ///  init locator
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => locator<ToDoBloc>()),
          ],
          child: const HomePage()
      ),
    );
  }
}