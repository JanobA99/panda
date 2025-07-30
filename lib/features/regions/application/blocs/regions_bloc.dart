import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/usecases/base_usecase.dart';
import '../../domain/entities/region.dart';
import '../../domain/usecases/get_regions_usecase.dart';
import '../../domain/usecases/search_regions_usecase.dart';

// Events
abstract class RegionsEvent extends Equatable {
  const RegionsEvent();

  @override
  List<Object?> get props => [];
}

class LoadRegions extends RegionsEvent {}

class SearchRegions extends RegionsEvent {
  final String query;

  const SearchRegions(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearSearch extends RegionsEvent {}

// States
abstract class RegionsState extends Equatable {
  const RegionsState();

  @override
  List<Object?> get props => [];
}

class RegionsInitial extends RegionsState {}

class RegionsLoading extends RegionsState {}

class RegionsLoaded extends RegionsState {
  final List<Region> regions;

  const RegionsLoaded(this.regions);

  @override
  List<Object?> get props => [regions];
}

class RegionsError extends RegionsState {
  final String message;

  const RegionsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc
class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  final GetRegionsUseCase getRegionsUseCase;
  final SearchRegionsUseCase searchRegionsUseCase;

  RegionsBloc({
    required this.getRegionsUseCase,
    required this.searchRegionsUseCase,
  }) : super(RegionsInitial()) {
    on<LoadRegions>(_onLoadRegions);
    on<SearchRegions>(_onSearchRegions);
    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadRegions(
    LoadRegions event,
    Emitter<RegionsState> emit,
  ) async {
    emit(RegionsLoading());

    final result = await getRegionsUseCase(const NoParams());

    result.fold(
      (failure) => emit(RegionsError(failure.message)),
      (regions) => emit(RegionsLoaded(regions)),
    );
  }

  Future<void> _onSearchRegions(
    SearchRegions event,
    Emitter<RegionsState> emit,
  ) async {
    if (event.query.isEmpty) {
      add(LoadRegions());
      return;
    }

    emit(RegionsLoading());

    final result = await searchRegionsUseCase(SearchRegionsParams(event.query));

    result.fold(
      (failure) => emit(RegionsError(failure.message)),
      (regions) => emit(RegionsLoaded(regions)),
    );
  }

  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<RegionsState> emit,
  ) async {
    add(LoadRegions());
  }
} 