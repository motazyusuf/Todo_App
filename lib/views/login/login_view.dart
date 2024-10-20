import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/pages_route_name.dart';
import 'package:todo_app/core/services/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var localization = AppLocalizations.of(context)!;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: Theme.of(context).primaryColorLight),
      child: Container(
        decoration: BoxDecoration(
            color: theme.primaryColorLight,
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/loginBackground.png"))),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              textAlign: TextAlign.center,
              localization.login,
              style: theme.textTheme.titleMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: height * 0.22,
                    ),
            
                    // Welcome back text
                    Text(
                      localization.welcomeBack,
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
            
                    const SizedBox(
                      height: 30,
                    ),
            
                    // email
                    Text(
                      localization.login,
                      style: theme.textTheme.displayMedium,
                    ),
                    TextFormField(
                      validator: (value) {
                        var regex = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your email";
                        } else if (!regex.hasMatch(value)) {
                          return "Invalid E-mail";
                        }
            
                        return null;
                      },
                      controller: emailController,
                      cursorColor: theme.primaryColor,
                      style: theme.textTheme.displaySmall
                          ,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 15),
                        suffixIcon: const Icon(
                          Icons.email,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: theme.primaryColor),
                        ),
                        hintText: localization.enterEmailAddress,
                        hintStyle: theme.textTheme.displaySmall,
                      ),
                    ),
            
                    const SizedBox(
                      height: 30,
                    ),
            
                    // password
                    Text(
                      localization.password,
                      style: theme.textTheme.displayMedium,
                    ),
                    TextFormField(
                      obscureText: isObscure ? true : false,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      controller: passwordController,
                      cursorColor: theme.primaryColor,
                      style: theme.textTheme.displaySmall
                          ,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 15),
                        suffixIcon: InkWell(
                          onTap: () {
                            isObscure = !isObscure;
                            setState(() {
                            });
                          },
                          child: Icon(isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        focusedBorder:  UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.primaryColor,
                            width: 2,
                          ),
                        ),
                        hintText: localization.enterPassword,
                        hintStyle: theme.textTheme.displaySmall,
                      ),
                    ),
            
                    const SizedBox(
                      height: 10,
                    ),
            
            
                    // forgot password
                    InkWell(
                      onTap: (){},
                      child: Text(
                        localization.forgotPassword,
                        style: theme.textTheme.displayMedium?.copyWith(color: theme.primaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
            
                    // login button
                    FilledButton(
                        onPressed: ()  async {
                          //
                          // Navigator.pushReplacementNamed(
                          //               context, PagesRouteName.layout);
                          if (formKey.currentState!.validate()) {
            
                            final message = await FirebaseAuthentication().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
            
                            if (message!.contains('Success')) {
                              Navigator.pushReplacementNamed(
                                  context, PagesRouteName.layout);
            
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Logged in"),
                                ),
                              );
                            }
            
                            else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                ),
                              );
                            }
                          }
                         },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(localization.login),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 15,
                            )
                          ],
                        )) ,
                    const SizedBox(
                      height: 10,
                    ),
            
            
                    // Create new account
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, PagesRouteName.registration);
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(left: width/4 ),
                        child: Text(
                          localization.createNewAccount,
                          style: theme.textTheme.displayMedium?.copyWith(color: theme.primaryColor, fontSize: 14),
                        ),
                      ),
                    ),
            
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// async {
//
//
// if (formKey.currentState!.validate()) {
// final message =
// await FirebaseAuthentication().registration(
// email: emailController.text,
// password: passwordController.text,
// );
//
// print("$message");
//
// if (message!.contains('Success')) {
// Navigator.pushReplacementNamed(
// context, PagesRouteName.layout);
// }
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text(message),
// ),
// );
// }
// ;
// }