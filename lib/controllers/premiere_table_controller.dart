import 'dart:convert';

import 'package:flutter_application_1/models/table_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PremiereTableController extends GetxController{
  var isLoading = false.obs;
  var standing = <Table>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPremierLeagueTable();
  }
  Future<void> fetchPremierLeagueTable() async{
    const url = 'https://www.thesportsdb.com/api/v1/json/3/lookuptable.php?l=4328&s=2025-2026';
    try{
      isLoading.value = true;
      final response = await http.get((Uri.parse(url)));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final List standingData = data['table'];
        standing .assignAll(standingData.map((e) => Table.fromJson(e)).toList());
    }else{
      Get.snackbar('Error', 'Failed to load Premier League table');
      }
    }
    catch (e) {
      print('Error fetching Premier League table: $e');
    } 
    isLoading.value = false;
  }
}