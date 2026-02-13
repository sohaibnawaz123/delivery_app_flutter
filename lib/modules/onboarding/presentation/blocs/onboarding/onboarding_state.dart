part of 'onboarding_bloc.dart';

class OnboardingState extends Equatable {
  final OnboardingViewInitialParams initialParams;
  final ApiResponse<BaseEntity<OnboardingEntity>> onboardingResponse;
  final int currentPageIndex;
  const OnboardingState({
    required this.initialParams,
    this.onboardingResponse = const ApiResponse.init(),
    this.currentPageIndex = 0,
  });

  OnboardingState copyWith({
    OnboardingViewInitialParams? initialParams,
    ApiResponse<BaseEntity<OnboardingEntity>>? onboardingResponse,
    int? currentPageIndex,
  }) {
    OnboardingState data = OnboardingState(
      initialParams: initialParams ?? this.initialParams,
      onboardingResponse: onboardingResponse ?? this.onboardingResponse,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
    Utils.logInfo(data.toString(), name: "Onboarding");
    return data;
  }

  @override
  List<Object?> get props => [
    initialParams,
    onboardingResponse,
    currentPageIndex,
  ];

  @override
  String toString() {
    return 'OnboardingState(initialParams: $initialParams, onboardingResponse: ${onboardingResponse.toString()}, currentPageIndex: $currentPageIndex)';
  }
}
