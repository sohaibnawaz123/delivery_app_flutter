part of 'fetch_all_product_bloc.dart';

class FetchAllProductState extends Equatable {
  final FetchAllProductViewInitialParams initialParams;
  final ApiResponse<BaseEntity<FetchAllProductEntity>> fetchAllProductResponse;

  const FetchAllProductState({
    required this.initialParams,
    this.fetchAllProductResponse = const ApiResponse.init(),
  });

   FetchAllProductState copyWith({
    FetchAllProductViewInitialParams? initialParams,
    ApiResponse<BaseEntity<FetchAllProductEntity>>? fetchAllProductResponse,
  }) {
    FetchAllProductState data =   FetchAllProductState(
      initialParams: initialParams ?? this.initialParams,
      fetchAllProductResponse: fetchAllProductResponse ?? this.fetchAllProductResponse,
    );
    Utils.logInfo(data.toString(), name: "FetchAllProduct");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, fetchAllProductResponse];

  @override
  String toString() {
    return 'FetchAllProductState(initialParams: $initialParams, fetchAllProductResponse: ${fetchAllProductResponse.toString()})';
  }
}
