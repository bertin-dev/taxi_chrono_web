import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../localizations/localization.dart';
import '../models/user_model.dart';
import '../views/login_view.dart';
import '../constants.dart';
import '../controller/simple_ui_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  static const String pageName = "signup_screen";

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cniController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController expectedCniController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController quarterController = TextEditingController();
  TextEditingController sexeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late AppLocalizations localization;
  var logger = Logger();
  final _db = FirebaseFirestore.instance;
  Administrator administrator = Administrator();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    localization = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return _buildLargeScreen(size, simpleUIController, theme);
                } else {
                  return _buildSmallScreen(size, simpleUIController, theme);
                }
              },
            ),
          )),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: RotatedBox(
            quarterTurns: 4,
            child: Image.asset(
              'assets/images/logo.jpg',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(size, simpleUIController, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return Center(
      child: _buildMainBody(size, simpleUIController, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        size.width > 600
            ? Container()
            : Image.asset(
                'assets/images/logo.jpg',
                height: size.height * 0.2,
                width: size.width,
                fit: BoxFit.fill,
              ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Sign Up',
            style: kLoginTitleStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Create Account',
            style: kLoginSubtitleStyle(size),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                /// username
                TextFormField(
                  style: kTextFormFieldStyle(),
                  onSaved: (val) => administrator.nom = val,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                      ),
                    ),
                  ),

                  controller: nameController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization.trans('please_enter_field');
                    } else if (value.length < 4) {
                      return localization.trans('at_leaster_enter');
                    } else if (value.length > 50) {
                      return localization.trans('maximum_character');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// cni
                TextFormField(
                  style: kTextFormFieldStyle(),
                  onSaved: (val) => administrator.cni = val,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    hintText: 'CNI',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                      ),
                    ),
                  ),

                  controller: cniController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization.trans('please_enter_field');
                    } else if (value.length < 4) {
                      return localization.trans('at_leaster_enter');
                    } else if (value.length > 50) {
                      return localization.trans('maximum_character');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// code
                TextFormField(
                  style: kTextFormFieldStyle(),
                  keyboardType: TextInputType.number,
                  onSaved: (val) => administrator.code = val,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Code',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                      ),
                    ),
                  ),

                  controller: codeController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization.trans('please_enter_field');
                    } else if (value.length < 4) {
                      return localization.trans('at_leaster_enter');
                    } else if (value.length > 50) {
                      return localization.trans('maximum_character');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// born
                /*TextFormField(
                  style: kTextFormFieldStyle(),
                  keyboardType: TextInputType.datetime,
                  onSaved: (val) => administrator.dateNaissance = val,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    hintText: 'Born',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),

                  controller: bornController,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization.trans('please_enter_field');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),*/

                /// Email
                TextFormField(
                  style: kTextFormFieldStyle(),
                  onSaved: (val) => administrator.email = val,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localization.trans('please_enter_email');
                    } else if (value.length < 4) {
                      return localization.trans('at_leaster_enter');
                    }else if (!value.isEmail) {
                      return localization.trans('please_enter_valid_email');
                    } else if (value.length > 50) {
                      return localization.trans('maximum_character');
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// password
                Obx(
                  () => TextFormField(
                    style: kTextFormFieldStyle(),
                    controller: passwordController,
                    onSaved: (val) => administrator.password = val,
                    obscureText: simpleUIController.isObscure.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_open),
                      suffixIcon: IconButton(
                        icon: Icon(
                          simpleUIController.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          simpleUIController.isObscureActive();
                        },
                      ),
                      hintText: 'Password',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localization.trans('please_enter_password');
                      } else if (value.length < 4) {
                        return localization.trans('at_leaster_enter');
                      } else if (value.length > 20) {
                        return localization.trans('maximum_character');
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  'Creating an account means you\'re okay with our Terms of Services and our Privacy Policy',
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// SignUp Button
                signUpButton(theme),
                SizedBox(
                  height: size.height * 0.03,
                ),

                /// Navigate To Login Screen
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (ctx) => const LoginView()));
                    nameController.clear();
                    cniController.clear();
                    codeController.clear();
                    bornController.clear();
                    emailController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();

                    simpleUIController.isObscure.value = true;
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: kHaveAnAccountStyle(size),
                      children: [
                        TextSpan(
                            text: " Login",
                            style: kLoginOrSignUpTextStyle(size)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // ... Navigate To your Login
            administrator.nom = nameController.text;
            administrator.cni = cniController.text;
            administrator.code = codeController.text;
            administrator.email = emailController.text;
            administrator.password = passwordController.text;
            createAccountUser(administrator);
          }
        },
        child: const Text('Sign up'),
      ),
    );
  }

  createAccountUser(Administrator admin) async {
    await _db.collection("administrateur").add(admin.toMap()).whenComplete(() {
      logger.i("Votre compte a ete crée avec succès.");
      //await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushNamed(LoginView.pageName);

    }).catchError((error, stackTrace) {
      showAlertDialog(context, error);
    });
  }

  showAlertDialog(BuildContext context, String message) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(localization.trans("error_message")!),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
