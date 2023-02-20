import 'package:flutter/material.dart';

class PasswordFormWidget extends StatefulWidget {
  const PasswordFormWidget(this.onSavedCallback, {Key? key}) : super(key: key);

  final Function(String?) onSavedCallback;

  @override
  State<PasswordFormWidget> createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  bool _isHidingPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password can't be empty";
        }
        return null;
      },
      onSaved: widget.onSavedCallback,
      obscureText: _isHidingPassword,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        suffixIcon: _isHidingPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isHidingPassword = !_isHidingPassword;
                  });
                },
                icon: const Icon(Icons.remove_red_eye),
                splashColor: Colors.transparent,
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    _isHidingPassword = !_isHidingPassword;
                  });
                },
                icon: const Icon(Icons.panorama_fish_eye),
                splashColor: Colors.transparent,
              ),
        label: const Text("Password"),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
