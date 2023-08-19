import "package:ecm_mobile/theme/input.dart";
import "package:flutter/material.dart";

class MyTextArea extends StatelessWidget {
  FormFieldSetter<String>? onSaved;

  MyTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        maxLines: null,
        decoration:
            inputDecoration.copyWith(label: const Text("Tên công việc")),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Nhập tên công việc";
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}
