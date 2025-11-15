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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final phoneController = TextEditingController();
    final avaterIdController = TextEditingController();
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
            Navigator.pushReplacementNamed(context, AppRoutesName.login);
          } else if (state is AuthFailure) {
            ErrorHandler.showError(context, state.error);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            bool isLoading = state is AuthLoading;
            return Scaffold(
              backgroundColor: ColorsManager.black,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(child: Image.asset(AssetsManager.logo)),
                    //name text field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        style: const TextStyle(
                            color: ColorsManager.white,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsManager.mutedBlack,
                            hintText: "Name",
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
                                    color: ColorsManager.mutedBlack),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: ColorsManager.mutedBlack),
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon: const ImageIcon(
                              AssetImage(AssetsManager.name),
                              color: ColorsManager.white,
                            )),
                      ),
                    ),
                    //email text field
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
                                borderSide:
                                    const BorderSide(color: ColorsManager.gold),
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
                    //password text field
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
                                borderSide:
                                    const BorderSide(color: ColorsManager.gold),
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
                    //re-password text field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: confirmPasswordController,
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
                            hintText: "Re-Password",
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
                                borderSide:
                                    const BorderSide(color: ColorsManager.gold),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: ColorsManager.mutedBlack),
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon: const ImageIcon(
                              AssetImage("assets/icons/lock.png"),
                              color: ColorsManager.white,
                            )),
                      ),
                    ),
                    //phone number text field
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneController,
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        style: const TextStyle(
                            color: ColorsManager.white,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsManager.mutedBlack,
                            hintText: "Phone Number",
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
                                borderSide:
                                    const BorderSide(color: ColorsManager.gold),
                                borderRadius: BorderRadius.circular(15)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: ColorsManager.mutedBlack),
                                borderRadius: BorderRadius.circular(15)),
                            prefixIcon: const ImageIcon(
                              AssetImage("assets/icons/phone.png"),
                              color: ColorsManager.white,
                            )),
                      ),
                    ),
                    //avaterId text field (for demo, you can use a dropdown or other widget)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: avaterIdController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: ColorsManager.mutedBlack,
                          hintText: "Avatar ID (e.g. 1)",
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
                              borderSide:
                                  const BorderSide(color: ColorsManager.gold),
                              borderRadius: BorderRadius.circular(15)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsManager.mutedBlack),
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: const Icon(Icons.person,
                              color: ColorsManager.white),
                        ),
                      ),
                    ),
                    //Create account button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        isloading: isLoading,
                        onPressed: () async {
                          context.read<AuthCubit>().register(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                                phone: phoneController.text,
                                avaterId:
                                    int.tryParse(avaterIdController.text) ?? 1,
                              );
                        },
                        text: "Create Account",
                      ),
                    ),
                    //Already Have Account ? Login
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
                                  fontFamily: GoogleFonts.roboto().fontFamily),
                              text: "Already Have Account ? ",
                              children: [
                                TextSpan(
                                    style: TextStyle(
                                        color: ColorsManager.gold,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily),
                                    text: "Login",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacementNamed(
                                            context, AppRoutesName.login);
                                      })
                              ],
                            )),
                      ),
                    ),
                    //language switch
                    Center(
                      child: AnimatedToggleSwitch<String>.rolling(
                        height: 36,
                        indicatorSize: const Size(42, 36),
                        clipBehavior: Clip.hardEdge,
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
                          Image.asset("assets/icons/en.png",
                              width: 24, height: 24),
                          Image.asset("assets/icons/ar.png",
                              width: 24, height: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
