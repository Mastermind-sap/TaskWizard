import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  // builds login dialog box
  @override
  Widget build(BuildContext ctx) {
    bool isPasswordVisible = false;
    String userID = "";
    String pass = "";
    return AlertDialog(
      title: const Text('Login'),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                key: _formKey,
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
                key: _formKey1,
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
              )
            ]);
      }),
      actions: [
        TextButton(
            onPressed: () {
              _goToHome();
            },
            child: const Text('Submit')),
      ],
    );
  }

  void _goToHome() {
    // final valid =
    //     _formKey.currentState!.validate() && _formKey1.currentState!.validate();
    // print(_formKey.currentState?.validate());
    // if (valid) {
    //   Get.to(const Home());
    // } else {
    //   print("ERRRRROOOOOOOOOOOOOOOOOOOOOORRRRRRRRRRRRRRRRRRR");
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     elevation: 0,
    //     behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.transparent,
    //     content: AwesomeSnackbarContent(
    //       title: 'On Snap!',
    //       message: 'Please fill the required details!',
    //       contentType: ContentType.failure,
    //     ),
    //   ));
    // }
    Get.to(const Home());
  }
}
