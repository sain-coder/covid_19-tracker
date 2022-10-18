import 'dart:convert';

import 'package:covid_19_tracker/Services/Utiles/Url.dart';
import 'package:http/http.dart' as http;

import '../Models/world_state_model.dart';

class StateServices{

  Future<WorldStateModel> fetchWorldRecorde()async{

    final response = await http.get(Uri.parse(Url.worldStateApi));

    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countryListApi()async{
    var data;
    final response = await http.get(Uri.parse(Url.countryList));

    if(response.statusCode==200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception('Error');
    }
  }

}


