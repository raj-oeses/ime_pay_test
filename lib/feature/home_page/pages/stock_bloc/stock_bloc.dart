// blocs/stock_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ime_pay_test/feature/home_page/data/model/share_data_model.dart';
import 'package:ime_pay_test/feature/home_page/data/share_data_repo/share_data_repo.dart';

import 'stock_event.dart';
import 'stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    //on fetching the data
    on<FetchStockData>((event, emit) async {
      emit(StockLoading());
      try {
        await ShareDataRepo().getData().then((value) => value?.fold(
            (ifLeft) => emit(StockError(ifLeft.reason)),
            (r) => emit(StockLoaded(r.data?.dayData, r, event.interval))));
      } catch (e) {
        print('Exceptio:::::::::________$e');
        emit(StockError(e.toString()));
      }
    });

    //On IntervalChange
    on<IntervalChange>((event, emit) {
      emit(StockLoading());
      List<Datum>? dataList;
      switch (event.changedEvent) {
        case 'min':
          dataList = event.totalData?.data?.minuteData;
          break;
        case 'hr':
          dataList = event.totalData?.data?.hourData;
          break;
        case 'day':
          dataList = event.totalData?.data?.dayData;
          break;
        case 'month':
          dataList = event.totalData?.data?.monthData;
          break;
        case 'year':
          dataList = event.totalData?.data?.yearlyData;
          break;
        default:
          dataList = [];
      }
      emit(StockLoaded(dataList, event.totalData, event.changedEvent));
    });
  }
}
