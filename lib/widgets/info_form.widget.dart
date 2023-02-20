import 'package:flutter/material.dart';

class InfoFormWidget extends StatelessWidget {
  const InfoFormWidget(this.title, this.iconData, this.onSavedCallback,
      {Key? key})
      : super(key: key);

  final String title;
  final IconData iconData;
  final Function(String?) onSavedCallback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$title can't be empty";
        }
        return null;
      },
      onSaved: onSavedCallback,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        prefixIcon: Icon(iconData),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
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
