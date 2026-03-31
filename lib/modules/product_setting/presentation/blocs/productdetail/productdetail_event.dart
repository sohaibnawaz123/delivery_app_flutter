part of 'productdetail_bloc.dart';

sealed class ProductdetailEvent {}

class  LoadProductdetailEvent extends ProductdetailEvent {
  final ProductdetailParam param;
   LoadProductdetailEvent(this.param);
}
