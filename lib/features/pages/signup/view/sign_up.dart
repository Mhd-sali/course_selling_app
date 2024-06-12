import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_udemy1/features/common/global_loader/global_loader.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';
import 'package:riverpod_udemy1/features/pages/signup/controller/registerstate.dart';
import 'package:riverpod_udemy1/features/pages/signup/controller/signupcontroller.dart';
import 'package:riverpod_udemy1/features/widgets/appBar.dart';
import 'package:riverpod_udemy1/features/widgets/apptextfield.dart';
import 'package:riverpod_udemy1/features/widgets/button_widgets.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final regprovider = ref.watch(regNOtProvider);
    final loader = ref.watch(apploaderProvider);

    return Container(
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(title: "Sign Up"),
              backgroundColor: Colors.white,
              body: loader == false
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: Text14Normal(
                                  text:
                                      "Enter your details below & free sign up")),
                          const SizedBox(
                            height: 50,
                          ),
                          appTextfield(
                            text: "User name",
                            iconNmae: ImageRes.user,
                            hinteTxt: "Enter your user name",
                            func: (value) => ref
                                .read(regNOtProvider.notifier)
                                .onUsernameChange(value),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          appTextfield(
                              text: "Email",
                              iconNmae: ImageRes.user,
                              hinteTxt: "Enter your email address",
                              func: (value) => ref
                                  .read(regNOtProvider.notifier)
                                  .onEmailChange(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          appTextfield(
                              text: "Password",
                              iconNmae: ImageRes.lock,
                              hinteTxt: "enter your password",
                              obscuretext: true,
                              func: (value) => ref
                                  .read(regNOtProvider.notifier)
                                  .onPasswordChange(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          appTextfield(
                              text: "Confirm your password",
                              iconNmae: ImageRes.lock,
                              obscuretext: true,
                              func: (value) => ref
                                  .read(regNOtProvider.notifier)
                                  .onRepasswordChange(value)),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25),
                            child: Text14Normal(
                                text:
                                    "By creating an account you are agreeing to the Terms&Conditions"),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: appButton(
                              buttonName: "Sign Up",
                              isLogin: true,
                              context: context,
                              func: () => _controller.handleSignup(),
                            ),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                        color: AppColors.primaryElement,
                      ),
                    ))),
    );
  }
}
