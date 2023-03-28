import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../MVVM/Model/ApiModels/ModPendingSaleOrder.dart';
import '../MVVM/ViewModel/VmDrawer.dart';
import '../MVVM/ViewModel/VmPendingSaleOrder.dart';

class SrPendingSaleOrder extends GetxController {
  final VmPendingSaleOrder G_VmPendingSaleOrder = Get.find();
  final G_currencyFormat = NumberFormat("#,##0", "en_US");

  RxList<ModPendingSaleOrder>? l_PrPendingSaleOrderList = <ModPendingSaleOrder>[].obs;

  void Fnc_addItem() {
    if (l_PrPendingSaleOrderList?.isEmpty ?? true) {
      l_PrPendingSaleOrderList?.addAll(G_VmPendingSaleOrder.l_PrPendingSaleOrderList!);
    }
  }

  RxList<ModPendingSaleOrder> Pr_filteredList = RxList<ModPendingSaleOrder>();
  RxString searchText = RxString("");

  void Fnc_filterlist(String query) {
    if (query.isEmpty) {
      Pr_filteredList.value = l_PrPendingSaleOrderList!;
      return;
    }

    List<String> lUserInput = query.toLowerCase().split(" ");
    List<ModPendingSaleOrder> lFilteredList = l_PrPendingSaleOrderList!.where((lListContent) {
      for (String lLetter in lUserInput) {
        if (!lListContent.Pr_VoucherNo.toLowerCase().contains(lLetter) &&
            !lListContent.Pr_VDate.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_CustomerRefNo.toString().toLowerCase().contains(lLetter) &&
            !lListContent.Pr_FGrandTotal.toString().toLowerCase().contains(lLetter) &&
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
