// blocs/stock_state.dart
import 'package:equatable/equatable.dart';
import 'package:ime_pay_test/feature/home_page/data/model/share_data_model.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
  List<Object> get props => [];
}

class StockInitial extends StockState {}

class StockLoading extends StockState {}

class StockLoaded extends StockState {
  final List<Datum>? stockData;
  final ShareDataModel? totalData;
  final String selectedInterval;

  const StockLoaded(
      {this.stockData, this.totalData, required this.selectedInterval});
}

class StockError extends StockState {
  final String message;

  const StockError(this.message);
}
