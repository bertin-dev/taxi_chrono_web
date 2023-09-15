

import 'package:flutter/material.dart';
import 'package:taxi_chrono_web/controller/dashboard_controller.dart';
//import 'components/drawer_menu.dart';
//import 'package:provider/provider.dart';
import 'package:taxi_chrono_web/models/user_model.dart';


class DashboardView extends StatefulWidget {
  static const String pageName = "dashboard_screen";
  Administrator? admin;
  DashboardView({super.key, this.admin});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: bgColor,
      //drawer: DrawerMenu(),
      //key: context.read<DashboardController>().scaffoldKey,
      body: SafeArea(
        child: Center(child: Text("Welcome ${widget.admin!.nom}"),)
        /*Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: DrawerMenu(),),
            Expanded(
              flex: 5,
              child: DashboardContent(),
            )
          ],
        ),*/
      ),
    );
  }
}
