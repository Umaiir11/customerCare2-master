import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../MVVM/Model/ApiModels/ModAccLedger.dart';
import '../MVVM/ViewModel/VmDrawer.dart';

class SrAccLedgerList extends GetxController {
  final VmDrawer G_VmDrawer = Get.find();
  final G_currencyFormat = NumberFormat("#,##0", "en_US");

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

    List<String> lUserInput = query.toLowerCase().split(" ");
    List<ModAccountLedger> lFilteredList = l_PrAccLedgerList!.where((lListContent) {
      for (String lLetter in lUserInput) {
        if (!lListContent.Pr_VNO.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Debit.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Credit.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_VDate.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Balance.toString().toLowerCase().contains(lLetter)) {
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
