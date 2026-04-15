part of 'myorders_bloc.dart';

class MyordersState extends Equatable {
  final MyordersViewInitialParams initialParams;
  final ApiResponse<BaseEntity<MyordersEntity>> myordersResponse;

  const MyordersState({
    required this.initialParams,
    this.myordersResponse = const ApiResponse.init(),
  });

   MyordersState copyWith({
    MyordersViewInitialParams? initialParams,
    ApiResponse<BaseEntity<MyordersEntity>>? myordersResponse,
  }) {
    MyordersState data =   MyordersState(
      initialParams: initialParams ?? this.initialParams,
      myordersResponse: myordersResponse ?? this.myordersResponse,
    );
    Utils.logInfo(data.toString(), name: "Myorders");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, myordersResponse];

  @override
  String toString() {
    return 'MyordersState(initialParams: $initialParams, myordersResponse: ${myordersResponse.toString()})';
  }
}
