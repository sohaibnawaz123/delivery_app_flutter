part of 'joinus_bloc.dart';

class JoinusState extends Equatable {
  final JoinusViewInitialParams initialParams;
  final ApiResponse<BaseEntity<JoinusEntity>> joinusResponse;

  const JoinusState({
    required this.initialParams,
    this.joinusResponse = const ApiResponse.init(),
  });

   JoinusState copyWith({
    JoinusViewInitialParams? initialParams,
    ApiResponse<BaseEntity<JoinusEntity>>? joinusResponse,
  }) {
    JoinusState data =   JoinusState(
      initialParams: initialParams ?? this.initialParams,
      joinusResponse: joinusResponse ?? this.joinusResponse,
    );
    Utils.logInfo(data.toString(), name: "Joinus");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, joinusResponse];

  @override
  String toString() {
    return 'JoinusState(initialParams: $initialParams, joinusResponse: ${joinusResponse.toString()})';
  }
}
