

import 'package:flutter/material.dart';
import 'package:taxi_chrono_web/controller/dashboard_controller.dart';
import '../constants/constants.dart';
import '../constants/responsive.dart';
import '../controller/salesperson_controller.dart';
import 'package:provider/provider.dart';
import 'package:taxi_chrono_web/models/user_account_model.dart';
import 'components/drawer_menu.dart';
import 'components/salesperson_content.dart';

class SalesPersonView extends StatefulWidget {
  const SalesPersonView({Key? key, this.admin}) : super(key: key);
  final Administrator? admin;
  static const String pageName = "salesperson";

  @override
  State<SalesPersonView> createState() => _SalesPersonViewState();
}

class _SalesPersonViewState extends State<SalesPersonView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(admin: widget.admin),
      key: context.read<SalesPersonController>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isWebDesktop(context)) const Expanded(child: DrawerMenu(),),
            Expanded(
              flex: 5,
              child: SalesPersonContent(admin: widget.admin),
            )
          ],
        ),
      ),
    );
  }
}
