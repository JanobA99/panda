import 'package:dartz/dartz.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/base_usecase.dart';
import '../entities/region.dart';
import '../repositories/region_repository.dart';

class SearchRegionsParams {
  final String query;

  const SearchRegionsParams(this.query);
}

class SearchRegionsUseCase implements UseCase<List<Region>, SearchRegionsParams> {
  final RegionRepository repository;

  const SearchRegionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Region>>> call(SearchRegionsParams params) async {
    return await repository.searchRegions(params.query);
  }
} 