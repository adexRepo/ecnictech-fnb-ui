import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ecnictech_fnb_ui/features/home/model/daily_purchase.dart';
import 'package:ecnictech_fnb_ui/features/home/model/daily_sales.dart';

abstract class HomeState<T> extends Equatable {
  final List<T> data;
  final Widget? widget;

  const HomeState(this.widget, {required this.data});
}

class SalesBodyState extends HomeState<DailySales> {
  const SalesBodyState(super.widget, {required super.data});

  @override
  List<Object?> get props => [];
}

class PurchaseBodyState extends HomeState<DailyPurchase> {
  const PurchaseBodyState(super.widget, {required super.data});

  @override
  List<Object?> get props => [];
}
