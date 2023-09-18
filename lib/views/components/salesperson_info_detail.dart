import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/salesperson_model.dart';


class SalesPersonInfoDetail extends StatelessWidget {
  const SalesPersonInfoDetail({Key? key, required this.itemSalesPerson}) : super(key: key);

  final SalesPerson itemSalesPerson;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: appPadding),
      padding: const EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              itemSalesPerson.photo ?? "assets/images/user.png",
              height: 38,
              width: 38,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemSalesPerson.userName?.toUpperCase() ?? "",
                    style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),

                  Text(
                    itemSalesPerson.userTelephone ?? "",
                    style: TextStyle(
                        color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.more_vert_rounded,color: textColor.withOpacity(0.5),size: 18,)
        ],
      ),
    );
  }
}
