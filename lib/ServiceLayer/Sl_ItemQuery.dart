import 'dart:convert';

import 'package:customercare/MVVM/Model/ParameterModels/ParModItemQuery.dart';

import '../../ClassModules/cmHttpCalls.dart';
import '../MVVM/Model/DTO/ModItemQuery.dart';

class Sl_ItemQuery {

  String   Pr_ItemID = "Pr_ItemID" ;
  String  Pr_UOM = "Pr_UOMGroupID" ;
  String  Pr_List1 = "Pr_List1";
  String  Pr_List2 = "Pr_List2";
  String  Pr_Str1= "Pr_String1" ;
  String  Pr_Str2= "Pr_String3" ;
  String Pr_Qty= "Pr_TaxID" ;
  String Pr_Rate= "Pr_MaxStock" ;
  String  Pr_Desc = "Pr_ItemDescr";



  Future<List<ModItemQueryDTO>?> Fnc_ItemQuery() async {
    try {
      List<String> DTOList = [
        Pr_ItemID ,
        Pr_UOM ,
        Pr_List1 ,
        Pr_List2 ,
        Pr_Str1 ,
        Pr_Str2 ,
        Pr_Qty ,
        Pr_Rate ,
        Pr_Desc ,
      ];
      print(DTOList);

      ParModItemQuery lParModItemQuery  = ParModItemQuery
        (Pr_Branchid: 1,
          Pr_WhereClause: "",
          Pr_GroupByClause: "",
          Pr_OrderByClause: "",
          Pr_List_Properties: DTOList
      );

      final body = {

        "Pr_Branchid": 1,
        "Pr_WhereClause": "",
        "Pr_GroupByClause": "",
        "Pr_OrderByClause": "",
        "Pr_List_Properties": DTOList
      };
      String lJsonString = json.encode((lParModItemQuery.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/ItemQuery/Fnc_Read_SP', lUtfContent);

      if (lResponse.statusCode == 200) {
        var a = lResponse;
        print(a);
        print("ItemsQueryList");
        return Fnc_JsonToListOfModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  ModItemQueryDTO Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModItemQueryDTO lModItemQuery = ModItemQueryDTO();

    lModItemQuery.Pr_ItemID = lJsonObject[Pr_ItemID];
    lModItemQuery.Pr_UOM = lJsonObject[Pr_UOM];
    lModItemQuery.Pr_List1 = lJsonObject[Pr_List1];
    lModItemQuery.Pr_List2 = lJsonObject[Pr_List2];
    lModItemQuery.Pr_Str1 = lJsonObject[Pr_Str1];
    lModItemQuery.Pr_Str2 = lJsonObject[Pr_Str2];
    lModItemQuery.Pr_Qty = lJsonObject[Pr_Qty];
    lModItemQuery.Pr_Rate = lJsonObject[Pr_Rate];
    lModItemQuery.Pr_Desc = lJsonObject[Pr_Desc];

    return lModItemQuery;
  }

  List<ModItemQueryDTO> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    List<ModItemQueryDTO> lListModItemQuery = List<ModItemQueryDTO>.empty(growable: true);
    for (dynamic lJsonObject in lJsonList) {
      ModItemQueryDTO lModItemQuery = ModItemQueryDTO();
      lModItemQuery = Fnc_JsonToModel(lJsonObject);
      lListModItemQuery.add(lModItemQuery);
    }
    return lListModItemQuery;
  }
}
