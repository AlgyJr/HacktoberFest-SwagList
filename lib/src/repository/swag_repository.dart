import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../constants.dart';
import '../models/swag.dart';

abstract class SwagRepository {
  Future<SwagList> getSwags();
}

class SwagRepositoryImpl extends SwagRepository {
  final _dio = Dio();

  Future<SwagList> getSwags() async {
    try {
      final _response = await _dio.get(Constants.DATA_URL);
      return SwagList.fromJson(_response.data);
    } catch (e, trace) {
      debugPrint("ERROR: $e\nTRACE: $trace");
      rethrow;
    }
  }
}