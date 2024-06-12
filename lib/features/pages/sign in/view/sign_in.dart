import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_udemy1/features/common/global_loader/global_loader.dart';
import 'package:riverpod_udemy1/features/common/utils/app_colors.dart';
import 'package:riverpod_udemy1/features/common/utils/image_resources.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/controller/signin_controller.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/controller/signin_notifier.dart';
import 'package:riverpod_udemy1/features/pages/sign%20in/widgets/sign_in_widgets.dart';
import 'package:riverpod_udemy1/features/widgets/appBar.dart';
import 'package:riverpod_udemy1/features/widgets/apptextfield.dart';
import 'package:riverpod_udemy1/features/widgets/button_widgets.dart';
import 'package:riverpod_udemy1/features/widgets/text_widget.dart';

class Signin extends ConsumerStatefulWidget {
  const Signin({super.key});

  @override
  ConsumerState<Signin> createState() => _SigninState();
}

class _SigninState extends ConsumerState<Signin> {
  late SigninController _controller;

  @override
  void didChangeDependencies() {
    // TODO: implement initState
    _controller = SigninController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final signinProvider = ref.watch(signinNotifierProvider);
    final loader = ref.watch(apploaderProvider);
    return Container(
      child: SafeArea(
          child: Scaffold(
              appBar: buildAppBar(title: "Login"),
              backgroundColor: Colors.white,
              body: loader == false
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          thirdPartyLogin(),
                          Center(
                              child: Text14Normal(
                                  text: "Or use your email account to login")),
                          const SizedBox(
                            height: 50,
                          ),
                          appTextfield(
                              controller: _controller.emailcontroller,
                              text: "Email",
                              iconNmae: ImageRes.user,
                              hinteTxt: "Enter your email address",
                              func: (value) => ref
                                  .read(signinNotifierProvider.notifier)
                                  .onEmailChange(value)),
                          SizedBox(
                            height: 20.h,
                          ),
                          appTextfield(
                            controller: _controller.passwordcontroller,
                            text: "Password",
                            iconNmae: ImageRes.lock,
                            hinteTxt: "enter your password",
                            obscuretext: true,
                            func: (value) => ref
                                .read(signinNotifierProvider.notifier)
                                .onPasswordChange(value),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            margin:  EdgeInsets.only(left: 25.w),
                            child: textunderline(text: "Forgot password?"),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          Center(
                              child: appButton(
                            buttonName: "Login",
                            func: () => _controller.handlesignin(ref),
                          )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: appButton(
                                func: () =>
                                    Navigator.pushNamed(context, "/register"),
                                buttonName: "Sign Up",
                                isLogin: false,
                                context: context),
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
