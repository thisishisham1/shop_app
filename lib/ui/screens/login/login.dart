import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/component/reusable_component.dart';
import 'package:shop_app/data/cache_helper/chache_data.dart';
import 'package:shop_app/style/theme.dart';
import 'package:shop_app/ui/screens/login/cubit/shop_app_login_cubit.dart';
import 'package:shop_app/ui/screens/register/register.dart';

import '../../layout/layout.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopAppLoginCubit(),
      child: BlocConsumer<ShopAppLoginCubit, ShopAppLoginState>(
        listener: (context, state) {
          if (state is ShopAppLoginSuccessState) {
            if (state.loginModel.status) {
              toastMessage(
                  message: state.loginModel.message, state: ToastState.SUCCESS);
              CacheData.saveData(
                      key: "Token", value: state.loginModel.data.token)
                  .then((value) {
                print(state.loginModel.data.token);
                navigateReplacement(context, Layout.routeName);
              });
            } else {
              print(state.loginModel.message);
              toastMessage(
                  message: state.loginModel.message, state: ToastState.ERROR);
            }
          }
        },
        builder: (context, state) {
          var loginCubit = ShopAppLoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: loginKey,
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
                              flex: 4,
                              child: customTextFiled(
                                  textEditingController: emailController,
                                  onFiledSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.length < 10) {
                                      return errorEmail;
                                    }
                                  },
                                  suffixIcon: Icon(Icons.email_outlined),
                                  hintText: "Enter your email",
                                  labelText: 'Email'),
                            ),
                            const SizedBox(height: 15),
                            Expanded(
                              flex: 4,
                              child: customTextFiled(
                                  isPassword: loginCubit.loginPassword,
                                  textInputType: TextInputType.visiblePassword,
                                  viewPassword: () {
                                    loginCubit.viewLoginPassword();
                                  },
                                  textEditingController: passwordController,
                                  onFiledSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.length < 7) {
                                      return errorPasswordLess;
                                    }
                                    if (value.isEmpty) {
                                      return errorPasswordEmpty;
                                    }
                                  },
                                  suffixIcon: Icon(Icons.lock_outline,
                                      color: loginCubit.loginPassword
                                          ? textColor
                                          : mainColor),
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
                                          value: loginCubit.rememberEmail,
                                          onChanged: (value) {
                                            loginCubit.rememberMe(value!);
                                          },
                                          activeColor: mainColor,
                                        ),
                                        Text(
                                          "Remember me",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
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
                                child: ConditionalBuilder(
                                  condition: state is! ShopAppLoginLoadingState,
                                  builder: (context) => customButton(
                                      text: "Sign in",
                                      onPressed: () {
                                        if (loginKey.currentState!.validate()) {
                                          loginCubit.userLogin(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      }),
                                  fallback: (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ))
                          ],
                        )),
                    const SizedBox(height: 15),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 40,
                              child: SignInButton(
                                  shape: const StadiumBorder(),
                                  Buttons.GoogleDark,
                                  onPressed: () {}),
                            ),
                            const SizedBox(height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don`t have an account?"),
                                TextButton(
                                    onPressed: () {
                                      navigatePush(context, Register());
                                    },
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
            ),
          );
        },
      ),
    );
  }
}
