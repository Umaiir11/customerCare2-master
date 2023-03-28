import 'dart:convert';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../ClassModules/cmHttpCalls.dart';


class SlEncryption {
  Future<String?> Fnc_ItemQuery() async {
    try {
      String l_jsonString = json.encode((cmGlobalVariables.Pb_jsonString));
      List<int> l_UtfContent = utf8.encode(l_jsonString);

      final l_response =
      await new cmHttpCalls().Fnc_HttpCallForEncryption(l_UtfContent);

      if (l_response.statusCode == 200) {
        String l_result = json.decode( json.encode(l_response.body));
        //return json.decode(l_response.body);
        print(l_result);
        return l_response.body;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
