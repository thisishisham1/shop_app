import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:shop_app/component/constant.dart';
import 'package:shop_app/ui/screens/register/cubit/shop_app_register_cubit.dart';
import '../../../component/reusable_component.dart';

class Register extends StatelessWidget {
  static String routeName = "register";
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppRegisterCubit, ShopAppRegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var registerCubit = ShopAppRegisterCubit.get(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: new AppBar(
            leading: IconButton(
                onPressed: () {
                  navigatePop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: registerKey,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "Register Account",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          '''Complete your details or continue
        with social media''',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          customTextFiled(
                              textInputType: TextInputType.text,
                              textEditingController: nameController,
                              onFiledSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return errorName;
                                }
                              },
                              suffixIcon: Icon(Icons.person),
                              hintText: "Enter your name",
                              labelText: 'Name'),
                          const SizedBox(height: 15),
                          customTextFiled(
                              textInputType: TextInputType.emailAddress,
                              textEditingController: emailController,
                              onFiledSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return errorEmail;
                                }
                              },
                              suffixIcon: Icon(Icons.email_outlined),
                              hintText: "Enter your email",
                              labelText: 'Email'),
                          const SizedBox(height: 15),
                          customTextFiled(
                              textInputType: TextInputType.phone,
                              textEditingController: phoneController,
                              onFiledSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return errorPhone;
                                }
                              },
                              suffixIcon: Icon(Icons.phone_android_outlined),
                              hintText: "Enter your phone",
                              labelText: 'Phone'),
                          const SizedBox(height: 15),
                          customTextFiled(
                              textInputType: TextInputType.visiblePassword,
                              isPassword: registerCubit.registerPassword,
                              viewPassword: () {
                                registerCubit.viewRegisterPassword();
                              },
                              textEditingController: passwordController,
                              onFiledSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return errorPasswordEmpty;
                                } else if (value.length < 7) {
                                  return errorPasswordLess;
                                }
                              },
                              suffixIcon: Icon(Icons.lock_outline),
                              hintText: "Enter your password",
                              labelText: 'Password'),
                          const SizedBox(height: 15),
                          customButton(text: "Register", onPressed: () {})
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 50,
                            child: SignInButton(
                                shape: const StadiumBorder(),
                                Buttons.GoogleDark,
                                onPressed: () {}),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '''By continuing your confirm that you agree
          with our term and condition''',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
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
    );
  }
}
