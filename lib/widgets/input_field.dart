import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Reason",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextFormField(
              cursorColor: const Color(0xff5c6bc0),
              validator: (value) {
                if (value == null || value.isEmpty || value.trim() == "") {
                  return 'This field is required.';
                }
                return null;
              },
              style: Theme.of(context).textTheme.bodyText1,
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
