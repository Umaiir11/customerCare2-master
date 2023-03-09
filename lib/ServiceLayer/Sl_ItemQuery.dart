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

      ParModItemQuery l_ParModItemQuery  = ParModItemQuery
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
      String l_jsonString = json.encode((l_ParModItemQuery.toJson()));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response = await new cmHttpCalls()
          .Fnc_HttpResponseERPBoth('/ItemQuery/Fnc_Read_SP', l_UtfContent);

      if (l_response.statusCode == 200) {
        var a = l_response;
        print(a);
        return Fnc_JsonToListOfModel(jsonDecode(l_response.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  ModItemQueryDTO Fnc_JsonToModel(Map<String, dynamic> l_JsonObject) {
    ModItemQueryDTO l_ModItemQuery = new ModItemQueryDTO();

    l_ModItemQuery.Pr_ItemID = l_JsonObject[Pr_ItemID];
    l_ModItemQuery.Pr_UOM = l_JsonObject[Pr_UOM];
    l_ModItemQuery.Pr_List1 = l_JsonObject[Pr_List1];
    l_ModItemQuery.Pr_List2 = l_JsonObject[Pr_List2];
    l_ModItemQuery.Pr_Str1 = l_JsonObject[Pr_Str1];
    l_ModItemQuery.Pr_Str2 = l_JsonObject[Pr_Str2];
    l_ModItemQuery.Pr_Qty = l_JsonObject[Pr_Qty];
    l_ModItemQuery.Pr_Rate = l_JsonObject[Pr_Rate];
    l_ModItemQuery.Pr_Desc = l_JsonObject[Pr_Desc];

    return l_ModItemQuery;
  }

  List<ModItemQueryDTO> Fnc_JsonToListOfModel(List<dynamic> l_JsonList) {
    List<ModItemQueryDTO> l_ListModItemQuery = new List<ModItemQueryDTO>.empty(growable: true);
    for (dynamic l_JsonObject in l_JsonList) {
      ModItemQueryDTO l_ModItemQuery = new ModItemQueryDTO();
      l_ModItemQuery = Fnc_JsonToModel(l_JsonObject);
      l_ListModItemQuery.add(l_ModItemQuery);
    }
    return l_ListModItemQuery;
  }
}
