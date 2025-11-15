// ignore_for_file: use_build_context_synchronously

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/routes/app_routes_name.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_movie_app/feature/auth/ui/cubit/auth_cubit.dart';
import 'package:new_movie_app/feature/auth/ui/cubit/auth_cubit_instance.dart';
import 'package:new_movie_app/feature/auth/ui/cubit/auth_state.dart';
import 'package:new_movie_app/core/widgets/error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocProvider<AuthCubit>.value(
      value: authCubitInstance,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthSuccess) {
            final token = state.userData['data'];
            if (token != null && token is String) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('auth_token', token);
            }
            Navigator.pushReplacementNamed(context, AppRoutesName.userHomeView);
          } else if (state is AuthFailure) {
            ErrorHandler.showError(context, state.error);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            bool isLoading = state is AuthLoading;
            return Scaffold(
              backgroundColor: ColorsManager.black,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      Center(child: Image.asset(AssetsManager.logo)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      //first text field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: emailController,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          style: const TextStyle(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsManager.mutedBlack,
                              hintText: "Email",
                              hintStyle: const TextStyle(
                                  color: ColorsManager.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.mutedBlack),
                                  borderRadius: BorderRadius.circular(15)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.mutedBlack),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.gold),
                                  borderRadius: BorderRadius.circular(15)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.mutedBlack),
                                  borderRadius: BorderRadius.circular(15)),
                              prefixIcon: const ImageIcon(
                                AssetImage(AssetsManager.email),
                                color: ColorsManager.white,
                              )),
                        ),
                      ),
                      //second text field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          style: const TextStyle(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorsManager.mutedBlack,
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                  color: ColorsManager.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.mutedBlack),
                                  borderRadius: BorderRadius.circular(15)),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.mutedBlack),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.gold),
                                  borderRadius: BorderRadius.circular(15)),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ColorsManager.mutedBlack),
                                  borderRadius: BorderRadius.circular(15)),
                              prefixIcon: const ImageIcon(
                                AssetImage(AssetsManager.lock),
                                color: ColorsManager.white,
                              )),
                        ),
                      ),
                      //forget password text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutesName.reset);
                              },
                              child: Text("Forget Password ?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsManager.gold,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ColorsManager.gold,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      //login button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          isloading: isLoading,
                          onPressed: () async {
                            context.read<AuthCubit>().login(
                                  emailController.text,
                                  passwordController.text,
                                );
                          },
                          text: "Login",
                        ),
                      ),
                      //Don’t Have Account ? Create One
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text.rich(
                              style: TextStyle(
                                  color: ColorsManager.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.roboto().fontFamily),
                              TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily:
                                        GoogleFonts.roboto().fontFamily),
                                text: "Don’t Have Account ? ",
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: ColorsManager.gold,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily),
                                      text: "Create One",
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushReplacementNamed(
                                              context, AppRoutesName.signUp);
                                        })
                                ],
                              )),
                        ),
                      ),
                      //or text
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height:
                                  MediaQuery.of(context).size.height * 0.002,
                              color: ColorsManager.gold,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Text("Or",
                                style: TextStyle(
                                    color: ColorsManager.gold,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily:
                                        GoogleFonts.roboto().fontFamily)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height:
                                  MediaQuery.of(context).size.height * 0.002,
                              color: ColorsManager.gold,
                            ),
                          ],
                        ),
                      ),
                      //login with google
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: ColorsManager.gold,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: ColorsManager.gold),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AssetsManager.google),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text("Login with google",
                                      style: TextStyle(
                                          color: ColorsManager.mutedBlack,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          fontFamily:
                                              GoogleFonts.roboto().fontFamily)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      //language switch
                      Center(
                        child: AnimatedToggleSwitch<String>.rolling(
                          height: 36,
                          indicatorSize: const Size(42, 36),
                          style: ToggleStyle(
                            backgroundColor: Colors
                                .transparent, // Background when not selected
                            borderRadius: BorderRadius.circular(20),
                            borderColor: ColorsManager.gold,
                            indicatorColor: ColorsManager.gold,
                          ),
                          current: "en",
                          values: const ["en", "ar"],
                          iconList: [
                            Image.asset(AssetsManager.en,
                                width: 24, height: 24),
                            Image.asset(AssetsManager.ar,
                                width: 24, height: 24),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
