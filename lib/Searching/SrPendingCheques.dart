import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../MVVM/Model/ApiModels/ModPendingCheques.dart';
import '../MVVM/ViewModel/VmDrawer.dart';

class SrPendingCheques extends GetxController {
  final VmDrawer G_VmDrawer = Get.find();
  final G_currencyFormat = NumberFormat("#,##0", "en_US");

  RxList<ModPendingCheques>? l_PendingChequesList = <ModPendingCheques>[].obs;

  void Fnc_addItem() {
    if (l_PendingChequesList?.isEmpty ?? true) {
      l_PendingChequesList?.addAll(G_VmDrawer.l_PrPendingChequesList!);
    }
  }

  RxList<ModPendingCheques> Pr_filteredList = RxList<ModPendingCheques>();
  RxString searchText = RxString("");

  void Fnc_filterlist(String query) {
    if (query.isEmpty) {
      Pr_filteredList.value = l_PendingChequesList!;
      return;
    }

    List<String> lUserInput = query.toLowerCase().split(" ");
    List<ModPendingCheques> lFilteredList = l_PendingChequesList!.where((lListContent) {
      for (String lLetter in lUserInput) {
        if (!lListContent.Pr_VoucherNo.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_ChequeNo.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_ChequeStatus.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Amount.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_VDate.toString().toLowerCase().contains(lLetter) ){
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
