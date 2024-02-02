import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

class SearchShopBox extends StatelessWidget {
  const SearchShopBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
      builder: (context, locationProvider, child) {
        return Container(
      height: 200,  
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: mainColor,
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
          SearchField(
              suggestions : locationProvider.predictionsTitles.map((e) => SearchFieldListItem<String>(e,
                child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16.0),
                      child: Text(e,
                        style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                      ),
                    ),
                  ),).toList(),
              onSearchTextChanged: (value) {
                locationProvider.placeAutoComplete(value);
                return null;
              },
              
              suggestionsDecoration:  SuggestionDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              marginColor: Colors.transparent,
              maxSuggestionsInViewPort :5,
              onSuggestionTap:(value){
                locationProvider.fetchNearestYperShops(value.searchKey);
                //dismiss keyboard
                FocusScope.of(context).unfocus();
                },
              textInputAction: TextInputAction.search,
              searchStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w200),
              searchInputDecoration: InputDecoration(
                hintText: "Ex : 59000, Lille",
                hintStyle: const TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
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
        ],
      ),
    );
      },
    );

  }
}