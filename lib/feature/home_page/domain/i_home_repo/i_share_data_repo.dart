import 'package:dartz/dartz.dart';
import 'package:ime_pay_test/feature/home_page/data/model/share_data_model.dart';

import '../../../../app_setup/failure_model.dart';

abstract class IShareDataRepo {
  Future<Either<Failure, ShareDataModel>?> getData();
}
