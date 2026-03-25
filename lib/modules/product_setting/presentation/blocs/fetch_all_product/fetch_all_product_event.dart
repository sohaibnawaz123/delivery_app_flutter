part of 'fetch_all_product_bloc.dart';

sealed class FetchAllProductEvent {}

class  LoadFetchAllProductEvent extends FetchAllProductEvent {
  final FetchAllProductParam param;
   LoadFetchAllProductEvent(this.param);
}
