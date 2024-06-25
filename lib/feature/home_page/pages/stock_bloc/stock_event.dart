// import 'package:equatable/equatable.dart';
// part of 'stock_bloc.dart';

// blocs/stock_event.dart

import 'package:equatable/equatable.dart';
import 'package:ime_pay_test/feature/home_page/data/model/share_data_model.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();

  @override
  List<Object> get props => [];
}

class FetchStockData extends StockEvent {
  final String interval;

  const FetchStockData(this.interval);
}

class IntervalChange extends StockEvent {
  final String changedEvent;
  final ShareDataModel? totalData;

  const IntervalChange(this.changedEvent, this.totalData);

}
