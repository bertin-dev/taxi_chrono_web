import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_chrono_web/controller/dashboard_controller.dart';
import 'package:taxi_chrono_web/controller/salesperson_controller.dart';
import 'package:taxi_chrono_web/views/components/profile_info.dart';
import 'package:taxi_chrono_web/views/components/search_field.dart';

import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';
import '../../../models/user_account_model.dart';

class CustomAppbar extends StatelessWidget {
  final Administrator? admin;
  final typeUser;
  const CustomAppbar({Key? key, this.admin, this.typeUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isWebDesktop(context))
          IconButton(
            onPressed: typeUser=="sales_person" ? context.read<SalesPersonController>().controlMenu : context.read<DashboardController>().controlMenu,
            icon: Icon(Icons.menu,color: textColor.withOpacity(0.5),),
          ),
        const Expanded(child: SearchField()),
        ProfileInfo(admin: admin)
      ],
    );
  }
}
