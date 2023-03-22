import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../MVVM/Model/ApiModels/ModCompanySettingQuery.dart';
import '../MVVM/ViewModel/VmCompany.dart';

class SrCompanyList extends GetxController {
  final VmCompany G_VmCompany = Get.find();


  RxList<ModCompanySettingQuery>? l_PrCompanyList =
      <ModCompanySettingQuery>[].obs;

  void Fnc_addItem() {
    if (l_PrCompanyList?.isEmpty ?? true) {
      l_PrCompanyList?.addAll(G_VmCompany.l_PrCompanyList!);
    }
  }

    RxList<ModCompanySettingQuery> Pr_filteredList =
        RxList<ModCompanySettingQuery>();
    RxString searchText = RxString("");

    void Fnc_filterlist(String query) {
      if (query.isEmpty) {
        Pr_filteredList.value = l_PrCompanyList!;
        return;
      }

      List<String> lUserInput = query.toLowerCase().split(" ");
      List<ModCompanySettingQuery> lFilteredList =
          l_PrCompanyList!.where((lListContent) {
        for ( String lLetter in lUserInput) {
          if (!lListContent.Pr_CompanyCity.toLowerCase().contains(lLetter) &&
              !lListContent.Pr_EmailId.toLowerCase().contains(lLetter) &&
              !lListContent.Pr_CompanyAddress.toLowerCase().contains(lLetter) &&
              !lListContent.Pr_CompanyPhone.toLowerCase().contains(lLetter) &&
              !lListContent.Pr_CompanyName.toLowerCase().contains(lLetter)) {
            return false;
          }
        }
        return true;
      }).toList();

      Pr_filteredList.value = lFilteredList;
    }

  TextSpan getMatchedTextSpan(String text, String query) {
    final regex = RegExp(query, caseSensitive: false);
    final matches = regex.allMatches(text);
    final List<TextSpan> textSpans = [];
    int startIndex = 0;
    for (Match match in matches) {
      final String matchText = match.group(0)!;
      const TextStyle matchStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );
      if (startIndex != match.start) {
        textSpans.add(TextSpan(text: text.substring(startIndex, match.start)));
      }
      textSpans.add(TextSpan(text: matchText, style: matchStyle));
      startIndex = match.end;
    }
    if (startIndex < text.length) {
      textSpans.add(TextSpan(text: text.substring(startIndex)));
    }
    return TextSpan(children: textSpans);
  }






}
