import 'package:bot_toast/bot_toast.dart';
import 'package:educational_kids_game/core/consts/app_styles.dart';
import 'package:educational_kids_game/core/consts/navigation_classes.dart';
import 'package:educational_kids_game/core/services/validation_service.dart';
import 'package:educational_kids_game/core/shared_widgets/button_builder.dart';
import 'package:educational_kids_game/core/shared_widgets/text_form_field_builder.dart';
import 'package:educational_kids_game/features/auth/domain/entity/register_entity.dart';
import 'package:educational_kids_game/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:educational_kids_game/features/auth/presentation/view/login_view.dart';
import 'package:educational_kids_game/features/auth/presentation/widget/float_app_bar.dart';
import 'package:educational_kids_game/features/home/view/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey<FormState> formKey = GlobalKey();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fullNameController = TextEditingController();
  var ageController = TextEditingController();
  bool showPassword = true;
  bool isLoading = false;
  onpressed() {
    setState(
      () {
        showPassword = !showPassword;
      },
    );
  }

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
        body: Form(
          key: formKey,
          child: CustomScrollView(
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
                          "Let's get started",
                          style: AppStyles.customTextStyleBl2,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Full Name
                      const Text(
                        'Full Name',
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormFieldBuilder(
                        // isPAdding: true,
                        label: 'Full Name',
                        validator: (value) {
                          return ValidationService()
                              .validateFullName(value, context);
                        },

                        controller: fullNameController,
                        type: TextInputType.text,
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

                      //  address
                      const Text(
                        'Age',
                        style: AppStyles.customTextStyleBl,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Address text field
                      TextFormFieldBuilder(
                        label: 'Age',
                        validator: (value) {
                          return ValidationService()
                              .validateAge(value, context);
                        },

                        controller: ageController,
                        type: TextInputType.number,
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
                          if (state is RegisterLoading) {
                            setState(() {
                              isLoading = true;
                            });
                          } else if (state is RegisterSuccess) {
                            setState(() {
                              isLoading = false;
                            });
                            navigateAndReplace(
                              context: context,
                              screen: const HomeView(),
                            );
                          } else if (state is RegisterFailure) {
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
                            text: 'Sign Up',
                            width: sW,
                            ontap: () {
                              if (formKey.currentState!.validate()) {
                                AuthCubit.get(context).authRegister(
                                  RegisterModel(
                                    name: fullNameController.text.toString(),
                                    email: emailController.text.toString(),
                                    password:
                                        passwordController.text.toString(),
                                    age: ageController.text.toString(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account',
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
                                            const LoginView()));
                              },
                              child: const Text(
                                'Sign In Now',
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
    );
  }
}
