part of 'productdetail_bloc.dart';

class ProductdetailState extends Equatable {
  final ProductdetailViewInitialParams initialParams;
  final ApiResponse<BaseEntity<ProductdetailEntity>> productdetailResponse;

  const ProductdetailState({
    required this.initialParams,
    this.productdetailResponse = const ApiResponse.init(),
  });

   ProductdetailState copyWith({
    ProductdetailViewInitialParams? initialParams,
    ApiResponse<BaseEntity<ProductdetailEntity>>? productdetailResponse,
  }) {
    ProductdetailState data =   ProductdetailState(
      initialParams: initialParams ?? this.initialParams,
      productdetailResponse: productdetailResponse ?? this.productdetailResponse,
    );
    Utils.logInfo(data.toString(), name: "Productdetail");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, productdetailResponse];

  @override
  String toString() {
    return 'ProductdetailState(initialParams: $initialParams, productdetailResponse: ${productdetailResponse.toString()})';
  }
}
