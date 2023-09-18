import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';
import '../../../constants/responsive.dart';
import '../../../models/user_account_model.dart';

class ProfileInfo extends StatelessWidget {
  final Administrator? admin;
  const ProfileInfo({Key? key, this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var profileName = admin?.userName?.toUpperCase() ?? "";
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/icons/Bell.svg",
                height: 25,
                color: textColor.withOpacity(0.8),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: red,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: appPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: appPadding,
            vertical: appPadding / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/user.png',
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                ),
              ),
              if(!Responsive.isMobile(context))
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
                child: Text(profileName,style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w800,
                ),),
              )
            ],
          ),
        )
      ],
    );
  }
}
