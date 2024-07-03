import 'package:dristi/src/features/hotels_list/data/data_sources/hotels_list_data_source.dart';
import 'package:dristi/src/features/hotels_list/data/repositories/hotels_list_repositories_impl.dart';
import 'package:dristi/src/features/hotels_list/domain/entities/hotels_list_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotelsListRepositoryProvider = Provider<HotelsListRepository>(
  (ref) {
    final dataSource = ref.read(hotelsListDataSourceProvider);
    return HotelsListRepositoryImp(dataSource: dataSource);
  },
);

abstract class HotelsListRepository {
  Future<List<HotelsListEntity>> getHotelsListComponents(String appLanguage);
}
