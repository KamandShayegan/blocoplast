import 'package:bloc_1/bloc/student_handler_cubit.dart';
import 'package:bloc_1/utils/enums/button_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String header1 = 'Bad Students';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var blocModel = context.read<StudentHandlerCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(header1),
                    const Divider(
                      thickness: 2,
                    ),
                    BlocBuilder<StudentHandlerCubit,
                        StudentHandlerState>(
                        builder: (context, handler) {
                          return Column(
                              children: handler.badSts
                                  .map((e) => Text(e))
                                  .toList());
                        })
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomForm(buttonState: ButtonState.delete,
              globalKey: _globalKey,
              controller: _controller,),
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.08,),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                blocModel.removeFromBadSts(_controller.text);
              }
            },
            child: const Text('Delete'),
            backgroundColor: Colors.red,
          ),
          FloatingActionButton.small(
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                blocModel.addToBadSts(_controller.text);
              }
            },
            child: const Text('Add'),
            backgroundColor: Colors.green,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
