import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:taxi_chrono_web/models/salesperson_model.dart';
import 'package:taxi_chrono_web/views/dashboard_view.dart';

import '../constants/constants.dart';
import '../controller/simple_ui_controller.dart';
import '../localizations/localization.dart';
import '../models/user_account_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const String pageName = "login";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  static _LoginViewState get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  late AppLocalizations localization;
  var logger = Logger();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    SimpleUIController simpleUIController = Get.put(SimpleUIController());
    localization = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return _buildLargeScreen(size, simpleUIController);
            } else {
              return _buildSmallScreen(size, simpleUIController);
            }
          },
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
      Size size,
      SimpleUIController simpleUIController,
      ) {
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
          child: _buildMainBody(
            size,
            simpleUIController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Center(
      child: _buildMainBody(
        size,
        simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
      Size size,
      SimpleUIController simpleUIController,
      ) {
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
            localization.trans("welcome")!,
            style: kLoginTitleStyle(size),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            localization.trans('please_authenticate')!,
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
                /// Email
                TextFormField(
                  style: kTextFormFieldStyle(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    hintText: localization.trans('email'),
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
                  controller: emailController,
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
                      hintText: localization.trans('password'),
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
                    localization.trans('confidentiality')!,
                  style: kLoginTermsAndPrivacyStyle(size),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                /// Login Button
                loginButton(),
                SizedBox(
                  height: size.height * 0.03,
                ),

                /// Navigate To Login Screen
                /*GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    emailController.clear();
                    passwordController.clear();
                    _formKey.currentState?.reset();
                    simpleUIController.isObscure.value = true;
                  },
                  child: RichText(
                    text: TextSpan(
                      text: localization.trans('not_have_account'),
                      style: kHaveAnAccountStyle(size),
                      children: [
                        TextSpan(
                          text: localization.trans('signup'),
                          style: kLoginOrSignUpTextStyle(
                            size,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Login Button
  Widget loginButton() {
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
            setState(() {
              isLoading = true;
            });
            // ... Navigate To your Dashboard
            getUserAuthenticate(emailController.text.trim(), passwordController.text.trim()).then((value) {
              setState(() {
                isLoading = false;
              });
              if(value != null){

                if(value is Administrator){
                  logger.d(value.toMap());
                  Navigator.of(context)
                      .pushNamed(DashboardView.pageName, arguments: {
                    "admin": value
                  });
                }
                if(value is SalesPerson){
                  logger.d("Bienvenue à vous commercial ${value.userName}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("La session du commercial n'est pas encore disponible"),
                      backgroundColor: Colors.green,
                    ),
                  );
                }

              } else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(localization.trans("email_or_password_not_found")!),
                    backgroundColor: Colors.redAccent,
                  ),
                );
                showAlertDialog(context, localization.trans("email_or_password_not_found")!);
              }

            });
          }
        },
        child: isLoading?  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localization.trans("loading")!, style: const TextStyle(fontSize: 20),),
            const SizedBox(width: 10,),
            const CircularProgressIndicator(color: Colors.white,),
          ],
        ) : Text(localization.trans('login')!, style: const TextStyle(fontSize: 20)),
      ),
    );
  }


  Future getUserAuthenticate(String email, String password) async {
    Administrator? adminData;
    SalesPerson? salesPersonData;

    // Vérification dans la collection "administrateur"
    final adminCollection = _db.collection('administrateur');
    final administratorQuery = await adminCollection
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .get();
    logger.d(administratorQuery.size);
    if (administratorQuery.docs.isNotEmpty) {
      adminData = administratorQuery.docs.map((e) => Administrator.fromSnapshot(e)).single;
      return adminData;
    }

    // Vérification dans la collection "Commerciaux"
    final salespersonCollection = _db.collection('Commerciaux');
    final salesPersonQuery = await salespersonCollection
        .where('email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .limit(1)
        .get();
    logger.d(salesPersonQuery.size);
    if (salesPersonQuery.docs.isNotEmpty) {
      salesPersonData = salesPersonQuery.docs.map((e) => SalesPerson.fromSnapshot(e)).single;
      return salesPersonData;
    }

    return null;

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
