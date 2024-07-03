import 'package:dristi/src/features/hotels_list/domain/entities/hotels_list_entity.dart';
import 'package:dristi/src/features/hotels_list/domain/repositories/hotels_list_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelsListUseCaseProvider = Provider(
  (ref) {
    return HotelsListUseCase(
      ref.read(hotelsListRepositoryProvider),
    );
  },
);

class HotelsListUseCase {
  HotelsListUseCase(this.repository);

  final HotelsListRepository repository;

  Future<List<HotelsListEntity>> getHotelsListComponents(
      String appLanguage) async {
    return repository.getHotelsListComponents(appLanguage);
  }
}
