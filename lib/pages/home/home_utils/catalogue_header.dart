import 'package:catalogue_app/utils/theme.dart';
import 'package:flutter/material.dart';

class CatalogueHeader extends StatelessWidget {
  const CatalogueHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catalogue App',
          style:
          TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: MyTheme.darkBlue,
          ),        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          'Trending Products',
          style:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        // color: MyTheme.darkBlue,
      ),
        )
      ],
    );
  }
}