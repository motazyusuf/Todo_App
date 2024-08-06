import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
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
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                textAlign: TextAlign.center,
                "Create account",
                style: theme.textTheme.titleMedium,
              ),
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
                    "Welcome on Board!",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // email
                  Text(
                    "Full name",
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
                        ?.copyWith(color: theme.primaryColorDark),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      suffixIcon: const Icon(
                        Icons.person,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: theme.primaryColor),
                      ),
                      hintText: "Enter your email address",
                      hintStyle: theme.textTheme.displaySmall,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // email
                  Text(
                    "E-mail",
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
                        ?.copyWith(color: theme.primaryColorDark),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 15),
                      suffixIcon: const Icon(
                        Icons.email,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: theme.primaryColor),
                      ),
                      hintText: "Enter your email address",
                      hintStyle: theme.textTheme.displaySmall,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // password
                  Text(
                    "Password",
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
                        ?.copyWith(color: theme.primaryColorDark),
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
                      hintText: "Enter your password",
                      hintStyle: theme.textTheme.displaySmall,
                    ),
                  ),

                  const SizedBox(
                    height: 60,
                  ),

                  // button
                  FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) print("Valid");
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Create account"),
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
