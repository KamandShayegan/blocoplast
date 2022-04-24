import 'package:bloc_1/utils/enums/button_state_enum.dart';
import 'package:bloc_1/utils/validators/text_form_field_validators.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final ButtonState buttonState;
final GlobalKey<FormState> globalKey;
final TextEditingController controller;
  const CustomForm({Key? key, required this.buttonState, required this.globalKey, required this.controller})
      : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextFormField(
              validator: (value) => Validator.validateUsersInput(value),
              controller: widget.controller,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
