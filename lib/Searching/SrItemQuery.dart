import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../MVVM/Model/ApiModels/ModAccLedger.dart';
import '../MVVM/Model/DTO/ModItemQuery.dart';
import '../MVVM/ViewModel/VmDrawer.dart';
import '../MVVM/ViewModel/VmItemQuery.dart';

class SrItemQuery extends GetxController {
  final VmItemQueryList G_VmItemQueryList = Get.find();
  final G_currencyFormat = NumberFormat("#,##0", "en_US");

  RxList<ModItemQueryDTO>? l_PrItemQueryList = <ModItemQueryDTO>[].obs;

  void Fnc_addItem() {
    if (l_PrItemQueryList?.isEmpty ?? true) {
      l_PrItemQueryList?.addAll(G_VmItemQueryList.l_PrItemQueryList!);
    }
  }

  RxList<ModItemQueryDTO> Pr_filteredList = RxList<ModItemQueryDTO>();
  RxString searchText = RxString("");

  void Fnc_filterlist(String query) {
    if (query.isEmpty) {
      Pr_filteredList.value = l_PrItemQueryList!;
      return;
    }

    List<String> lUserInput = query.toLowerCase().split(" ");
    List<ModItemQueryDTO> lFilteredList = l_PrItemQueryList!.where((lListContent) {
      for ( String lLetter in lUserInput) {
        if (!lListContent.Pr_ItemID.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_UOM.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_List1.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Str1.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_List2.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Qty.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Rate.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Desc.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_Str2.toLowerCase().contains(lLetter)) {
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
