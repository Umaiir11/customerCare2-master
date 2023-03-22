import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../MVVM/Model/ApiModels/ModAccLedger.dart';
import '../MVVM/Model/ApiModels/ModCompanySettingQuery.dart';
import '../MVVM/ViewModel/VmDrawer.dart';
import '../MVVM/ViewModel/VmCompany.dart';

class SrAccLedgerList extends GetxController {
  final VmDrawer G_VmDrawer = Get.find();

  RxList<ModAccountLedger>? l_PrAccLedgerList = <ModAccountLedger>[].obs;

  void Fnc_addItem() {
    if (l_PrAccLedgerList?.isEmpty ?? true) {
      l_PrAccLedgerList?.addAll(G_VmDrawer.l_PrAccountLedgerList!);
    }
  }

  RxList<ModAccountLedger> Pr_filteredList = RxList<ModAccountLedger>();
  RxString searchText = RxString("");

  void Fnc_filterlist(String query) {
    if (query.isEmpty) {
      Pr_filteredList.value = l_PrAccLedgerList!;
      return;
    }

    List<String> l_UserInput = query.toLowerCase().split(" ");
    List<ModAccountLedger> l_filteredList =
        l_PrAccLedgerList!.where((l_ListContent) {
      for (String l_letter in l_UserInput) {
        if (!l_ListContent.Pr_VNO.toLowerCase().contains(l_letter) &&
            !l_ListContent.Pr_Debit.toString()
                .toLowerCase()
                .contains(l_letter) &&
            !l_ListContent.Pr_Credit.toString()
                .toLowerCase()
                .contains(l_letter) &&
            !l_ListContent.Pr_VDate.toString()
                .toLowerCase()
                .contains(l_letter) &&
            !l_ListContent.Pr_Balance.toString()
                .toLowerCase()
                .contains(l_letter)) {
          return false;
        }
      }
      return true;
    }).toList();

    Pr_filteredList.value = l_filteredList;
  }

  TextSpan getMatchedTextSpan(String text, String query) {
    final regex = RegExp(query, caseSensitive: false);
    final matches = regex.allMatches(text);
    final List<TextSpan> textSpans = [];
    int startIndex = 0;
    for (Match match in matches) {
      final String matchText = match.group(0)!;
      final TextStyle matchStyle = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.yellowAccent,
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
