import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/pages_route_name.dart';
import 'package:todo_app/core/services/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

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
              localization.createAccount,
              style: theme.textTheme.titleMedium,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: height * 0.22,
                  ),

                  // Welcome on board
                  Text(
                    localization.welcomeOnBoard,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // full name
                  Text(
                    localization.fullName,
                    style: theme.textTheme.displayMedium,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localization.enterFullName;
                      }

                      return null;
                    },
                    controller: personController,
                    cursorColor: theme.primaryColor,
                    style: theme.textTheme.displaySmall
                     ,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      suffixIcon: const Icon(
                        Icons.person,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: theme.primaryColor),
                      ),
                      hintText: localization.enterFullName,
                      hintStyle: theme.textTheme.displaySmall,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // email
                  Text(
                    localization.mail,
                    style: theme.textTheme.displayMedium,
                  ),
                  TextFormField(
                    validator: (value) {
                      var regex = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value == null || value.trim().isEmpty) {
                        return localization.pleaseEnterYourEmail;
                      } else if (!regex.hasMatch(value)) {
                        return localization.invalidEmail;
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
                        return localization.pleaseEnterYourPassword;
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
                          setState(() {});
                        },
                        child: Icon(isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                      hintText: localization.enterPassword,
                      hintStyle: theme.textTheme.displaySmall,
                    ),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

                  // registration button
                  FilledButton(
                      onPressed: () async {


                        if (formKey.currentState!.validate()) {
                          final message =
                              await FirebaseAuthentication().registration(
                            email: emailController.text,
                            password: passwordController.text,
                          );



                          if (message!.contains('Success')) {
                            Navigator.pushReplacementNamed(
                                context, PagesRouteName.layout);


                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Logged in"),
                              ),
                            );
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          }
                        }
                        ;
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(localization.createAccount),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 15,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
