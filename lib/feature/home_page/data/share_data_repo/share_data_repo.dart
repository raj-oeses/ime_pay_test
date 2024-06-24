import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ime_pay_test/feature/home_page/data/model/share_data_model.dart';

import '../../../../app_setup/failure_model.dart';
import '../../../../app_setup/remote_services/http_service_impl.dart';
import '../../domain/i_home_repo/i_share_data_repo.dart';

class ShareDataRepo extends IShareDataRepo {
  @override
  Future<Either<Failure, ShareDataModel>?> getData(
      {String? requiredUrl}) async {
    try {
      return await HttpServiceImpl().get('94c26c8e-2cb1-4a10-be1c-eb03d84708ce').then((value) =>
          value.fold((l) => Left(l),
              (r) => Right(shareDataModelFromJson(jsonEncode(r)))));
    } catch (e) {
      log('Exception ::::---===${e}');
    }
    return null;
  }
}
