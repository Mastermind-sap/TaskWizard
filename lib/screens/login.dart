import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:todo/constants/colors.dart";
import "package:todo/screens/home.dart";
import "package:todo/widgets/animatedbutton.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences sharedPreferences;
  final _TextController = TextEditingController();

  Widget _buildLoginDialog(BuildContext ctx) {
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
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'User ID:',
                  hintText: 'Enter your User Id',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => userID = value,
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password:',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
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
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => pass = value,
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

  Widget _buildSignUpDialog(BuildContext ctx) {
    bool isPasswordVisible = false;
    bool isPasswordVisible1 = false;
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
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'User ID:',
                  hintText: 'Enter your User Id',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => userID = value,
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password:',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
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
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => pass = value,
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: !isPasswordVisible1,
                decoration: InputDecoration(
                  labelText: 'Confirm Password:',
                  hintText: 'Enter your password again',
                  prefixIcon: Icon(Icons.lock),
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
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => pass = value,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBGColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          OutlinedButton(
            onPressed: null,
            child: AnimatedButton(
                height: 100,
                width: 200,
                text: "Log In",
                animationColor: violet,
                onTapfunc: () => showDialog(
                      context: context,
                      builder: ((ctx) => _buildLoginDialog(ctx)),
                    )),
          ),
          SizedBox(height: 100),
          OutlinedButton(
            onPressed: null,
            child: AnimatedButton(
                height: 100,
                width: 200,
                text: "Sign In",
                animationColor: violet,
                onTapfunc: () => showDialog(
                      context: context,
                      builder: ((ctx) => _buildSignUpDialog(ctx)),
                    )),
          ),
        ],
      )),
    );
  }

  void loginUser() {}

  void createUser() {}

  void logOutUser() {}

  void delUser() {}

  void getCurrentUser() {}

  void changePass() {}
}
