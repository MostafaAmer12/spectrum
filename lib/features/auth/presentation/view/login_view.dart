import 'package:bot_toast/bot_toast.dart';
import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/core/consts/navigation_classes.dart';
import 'package:educational_kids_game/core/services/validation_service.dart';
import 'package:educational_kids_game/core/shared_widgets/button_builder.dart';
import 'package:educational_kids_game/features/auth/domain/entity/login_entity.dart';
import 'package:educational_kids_game/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:educational_kids_game/features/auth/presentation/view/register_view.dart';
import 'package:educational_kids_game/features/auth/presentation/widget/float_app_bar.dart';
import 'package:educational_kids_game/core/shared_widgets/text_form_field_builder.dart';
import 'package:educational_kids_game/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool showPassword = true;
  onpressed() {
    setState(
      () {
        showPassword = !showPassword;
      },
    );
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final sW = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppStyles.primaryW2,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            floatAppBar(sW, 300),
          ];
        },
        body: Container(
          color: AppStyles.primaryW2,
          child: Form(
            key: formKey,
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        // welcome text
                        const Center(
                          child: Text(
                            'Welcome Back!',
                            style: AppStyles.customTextStyleBl2,
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        // Email address
                        const Text(
                          'Email address',
                          style: AppStyles.customTextStyleBl,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // username text field
                        TextFormFieldBuilder(
                          label: 'Email',
                          validator: (value) {
                            return ValidationService()
                                .validateEmail(value, context);
                          },
                          controller: emailController,
                          type: TextInputType.text,
                          width: sW,
                          // isPAdding: true,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // Password
                        const Text(
                          'Password',
                          style: AppStyles.customTextStyleBl,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // password text field
                        TextFormFieldBuilder(
                          label: 'Password',
                          obsecure: showPassword,
                          validator: (value) {
                            return ValidationService()
                                .validatePassword(value, context);
                          },

                          controller: passwordController,
                          suffix: IconButton(
                            onPressed: () {
                              onpressed();
                            },
                            icon: showPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          type: TextInputType.text,
                          width: sW,
                          // isPAdding: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // login button
                        BlocListener<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is LoginLoading) {
                              setState(() {
                                isLoading = true;
                              });
                            } else if (state is LoginSuccess) {
                              setState(() {
                                isLoading = false;
                              });
                              navigateAndReplace(
                                context: context,
                                screen: const HomeView(),
                              );
                            } else if (state is LoginFailure) {
                              setState(() {
                                isLoading = false;
                              });
                              BotToast.showText(
                                text: state.errorMessage,
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              BotToast.showText(
                                text:
                                    'Something went wrong, please try again later',
                              );
                            }
                          },
                          child: Center(
                            child: ButtonBuilder(
                              text: 'Sign In',
                              width: sW,
                              isLoading: isLoading,
                              ontap: () {
                                if (formKey.currentState!.validate()) {
                                  print(emailController.text.toString());
                                  print(passwordController.text.toString());

                                  AuthCubit.get(context).authLogin(
                                    LoginModel(
                                      email: emailController.text.toString(),
                                      password:
                                          passwordController.text.toString(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account',
                              style: TextStyle(
                                color: AppStyles.primaryG,
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(
                                    color: AppStyles.primaryB,
                                    fontSize: 15,
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
