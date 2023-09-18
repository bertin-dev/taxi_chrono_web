import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../localizations/localization.dart';
import 'bar_chart_users.dart';

class SalesPersons extends StatelessWidget {
  const SalesPersons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.trans('salesperson')!,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: textColor,
            ),
          ),
          const Expanded(
            child: BarChartUsers(),
          )
        ],
      ),
    );
  }
}
