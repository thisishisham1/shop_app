import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:shop_app/component/reusable_component.dart';
import 'package:shop_app/style/theme.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "login screen";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.black),
                  ),
                  Text(
                    '''Sign in with your email and password
      or continue with social media''',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: customTextFiled(
                          textEditingController: emailController,
                          onFiledSubmitted: (value) {},
                          validator: (value) {},
                          suffixIcon: Icons.email_outlined,
                          hintText: "Enter your email",
                          labelText: 'Email'),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      flex: 3,
                      child: customTextFiled(
                          obScureText: true,
                          textInputType: TextInputType.visiblePassword,
                          viewPassword: () {},
                          textEditingController: passwordController,
                          onFiledSubmitted: (value) {},
                          validator: (value) {},
                          suffixIcon: Icons.lock_outline,
                          hintText: "Enter your password",
                          labelText: "password"),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: mainColor,
                                ),
                                Text(
                                  "Remember me",
                                  style:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Forgot password ?"),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                        flex: 2,
                        child:
                            customButton(text: "Sign in", onPressed: () {}))
                  ],
                )),
            const SizedBox(height: 15),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 50,
                      child: SignInButton(
                          shape: StadiumBorder(),
                          Buttons.GoogleDark,
                          onPressed: () {}),
                    ),
                    const SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don`t have an account?"),
                        TextButton(
                            onPressed: () {},
                            child: Text("Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(color: mainColor))),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
