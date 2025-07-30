import 'package:dartz/dartz.dart';
import '../../../../core/domain/failures/failures.dart';
import '../../../../core/domain/usecases/base_usecase.dart';
import '../entities/region.dart';
import '../repositories/region_repository.dart';

class GetRegionsUseCase implements UseCase<List<Region>, NoParams> {
  final RegionRepository repository;

  const GetRegionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Region>>> call(NoParams params) async {
    return await repository.getRegions();
  }
} 