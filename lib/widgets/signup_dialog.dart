import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home.dart';

class SignUpDialog extends StatefulWidget {
  const SignUpDialog({super.key});

  @override
  State<SignUpDialog> createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog> {
  //Builds the sign up dialogue box
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;
    bool isPasswordVisible1 = false;
    String userID = "";
    String pass = "";
    String pass1 = "";
    return AlertDialog(
      title: const Text('Login'),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'User ID:',
                  hintText: 'Enter your User Id',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => userID = value,
                validator: (String? value) {
                  return (value!.isEmpty) ? 'Cannot be empty' : null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password:',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) => pass = value,
                validator: (String? value) {
                  return (value!.length < 8)
                      ? 'Cannot be less than 8 characters'
                      : null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: !isPasswordVisible1,
                decoration: InputDecoration(
                  labelText: 'Confirm Password:',
                  hintText: 'Enter your password again',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible1
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible1 = !isPasswordVisible1;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) => pass1 = value,
                validator: (String? value) {
                  return (value != pass) ? 'Re-enter the exact password' : null;
                },
              )
            ]);
      }),
      actions: [
        TextButton(
            onPressed: () {
              Get.to(Home());
            },
            child: const Text('Submit')),
      ],
    );
  }
}
