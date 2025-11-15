import 'package:flutter/material.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/routes/app_routes_name.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/widgets/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        title: const Text(
          "Forget Password",
          style: TextStyle(color: ColorsManager.gold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutesName.login);
            },
            icon: const Icon(Icons.arrow_back, size: 25, color: ColorsManager.gold)),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AssetsManager.reset),
                const Spacer(
                  flex: 1,
                ),
                //first text field
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                            borderSide:
                                const BorderSide(color: ColorsManager.mutedBlack),
                            borderRadius: BorderRadius.circular(15)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorsManager.mutedBlack),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: ColorsManager.gold),
                            borderRadius: BorderRadius.circular(15)),
                        disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: ColorsManager.mutedBlack),
                            borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const ImageIcon(
                          AssetImage("assets/icons/email.png"),
                          color: ColorsManager.white,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      isloading: false,
                      onPressed: () {},
                      text: "Reset Password"),
                ),
                const Spacer(
                  flex: 4,
                ),
              ],
            )),
      ),
    );
  }
}
