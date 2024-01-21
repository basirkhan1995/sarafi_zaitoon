import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:sarafi_zaitoon/Components/Methods/button.dart';
import 'package:sarafi_zaitoon/Components/Methods/input_field.dart';
import 'package:sarafi_zaitoon/Components/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: size.width*.8,
                    child: Image.asset("assets/photos/login.gif")),
               InputField(
                   label: "username",
                   icon: Icons.account_circle_rounded,
                   controller: username,
                   validator: (value){
                     if(value.isEmpty){
                       return Locales.string(context, "username_required");
                     }
                     return null;
                   },
               ),
                InputField(
                    label: "password",
                    icon: Icons.lock,
                    controller: password,
                    validator: (value){
                    if(value.isEmpty){
                      return Locales.string(context, "password_required");
                    }
                    return null;
                  },
                ),

                ListTile(
                  horizontalTitleGap: 2,
                  leading: Checkbox(
                      activeColor: primaryColor,
                      value: isChecked,
                      onChanged: (value)=>setState(()=> isChecked = !isChecked)
                  ),
                  title: const LocaleText("remember_me"),
                ),
                ZButton(
                    height: 60,
                    label: "login",
                    press: (){
                      if(formKey.currentState!.validate()){

                      }
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
