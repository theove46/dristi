import 'package:dristi/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import 'package:dristi/src/features/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onBoardingUseCaseProvider = Provider(
  (ref) {
    return OnBoardingUseCase(
      ref.read(onBoardingRepositoryProvider),
    );
  },
);

class OnBoardingUseCase {
  OnBoardingUseCase(this.repository);

  final OnBoardingRepository repository;

  Future<void> setFirstTimeStatusFalse() async {
    await repository.setFirstTimeStatusFalse();
  }

  Future<bool> getFirstTimeStatus() async {
    return repository.getFirstTimeStatus();
  }

  Future<List<OnBoardingEntity>> getOnBoardingComponents() async {
    return repository.getOnBoardingComponents();
  }

  Future<(String, dynamic)> buttonSubmit() async {
    return repository.buttonSubmit();
  }
}
