import 'package:bloc_1/bloc/student_handler_cubit.dart';
import 'package:bloc_1/ui/custom_form.dart';
import 'package:bloc_1/ui/my_homepage.dart';
import 'package:bloc_1/utils/enums/button_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentHandlerCubit(),
      child: MaterialApp(
        title: 'Flutter BLOC',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage(title: 'Bloc no.1'),
      ),
    );
  }
}

