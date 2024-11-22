import 'package:flutter/material.dart';

class UiHelper {
  static TextFormField customTextField(
      {required TextEditingController controller,
      required String hintText,
      BorderRadius? borderRadius,
      TextInputType? inputType,
      int? maxLine}) {
    return TextFormField(
      maxLines: maxLine,
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          )),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field are required';
        }
        return null;
      },
    );
  }

  static Widget customElevatedButton(
      {required VoidCallback callback, required String child}) {
    return ElevatedButton(
        onPressed: () {
          callback();
        },
        child: Text(child));
  }

  static Widget customFloatingActionButton(VoidCallback callback, Icon icon) {
    return FloatingActionButton(
        onPressed: () {
          callback();
        },
        child: icon);
  }
}
