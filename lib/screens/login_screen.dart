import 'package:ecommerce_flogics/constants/font_sizes/font_sizes.dart';
import 'package:ecommerce_flogics/constants/paths/route_paths.dart';
import 'package:ecommerce_flogics/models/user_login_input.dart';
import 'package:ecommerce_flogics/providers/auth_provider.dart';
import 'package:ecommerce_flogics/shared_widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../apis/authentication_apis.dart';
import '../constants/paths/image_paths.dart';
import '../constants/strings.dart';
import '../shared_widgets/custom_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserLoginInput user = UserLoginInput();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Text(
                  Strings.LOG_IN_ENG,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: FontSizes.FONT_SIZE_32),
                )),
                SizedBox(
                  height: 50,
                ),
                Text(Strings.ENTER_USER_NAME_LABEL_ENG,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                CustomInput(
                    hintText: Strings.ENTER_USER_NAME_HINT_ENG,
                    textInputType: TextInputType.name,
                    onSaved: (v) => user.username = v!,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Enter a valid name";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 36,
                ),
                Text(
                  Strings.ENTER_PASS_LABEL_ENG,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomInput(
                    hintText: Strings.ENTER_PASS_HINT_ENG,
                    textInputType: TextInputType.visiblePassword,
                    onSaved: (v) => user.password = v!,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Enter a valid password";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: 36,
                ),
                PrimaryButton(
                  text: Strings.SIGN_IN_ENG,
                  action: () async {
                    final isFormValid = _formKey.currentState!.validate();
                    if (isFormValid) {
                      _formKey.currentState?.save();

                      bool isSuccess =
                          await context.read<AuthProvider>().login(user);
                      if (isSuccess) {
                        Navigator.pushReplacementNamed(
                            context, RoutePaths.HOME_SCREEN_ROUTE_ID);
                      } else {
                        String responseErrorMessage =
                            context.read<AuthProvider>().responseMessage;
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(responseErrorMessage)));
                      }
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill required fields")));
                  },
                  height: 45,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
