import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/theme/app_theme.dart';

class SearchShopBox extends StatelessWidget {
  const SearchShopBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(70),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Je cherche mon magasin",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Form(
            child: TextFormField(
              onChanged: (value) {},
              textInputAction: TextInputAction.search,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w200),
              decoration: InputDecoration(
                hintText: "Ex : 59000 Lille",
                hintStyle: const TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                ),
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1, color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}