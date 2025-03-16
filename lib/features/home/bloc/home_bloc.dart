import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_event.dart';
import 'package:ecnictech_fnb_ui/features/home/bloc/home_state.dart';
import 'package:ecnictech_fnb_ui/features/home/pages/purchase.dart';
import 'package:ecnictech_fnb_ui/features/home/pages/sales.dart';

enum EnumHomeBody { sales, purchase }

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const SalesBodyState(SalesPage(), data: [])) {
    // Event handlers for HomeSalesEvent and HomePurchaseEvent
    on<HomeSalesEvent>((event, emit) {
      emit(const SalesBodyState(
        SalesPage(key: ValueKey(EnumHomeBody.sales)),
        data: [],
      ));
    });

    on<HomePurchaseEvent>((event, emit) {
      emit(const PurchaseBodyState(
        PurchasePage(key: ValueKey(EnumHomeBody.purchase)),
        data: [],
      ));
    });
  }
}
