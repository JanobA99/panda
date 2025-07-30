import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../core/presentation/l10n/app_localizations.dart';
import '../../../../core/presentation/widgets/panda_header.dart';
import '../../../../core/presentation/widgets/panda_search_bar.dart';
import '../../../../core/presentation/widgets/region_list_item.dart';
import '../../../../core/presentation/widgets/region_shimmer.dart';
import '../../../../core/application/services/language_service.dart';
import '../../../regions/regions.dart';
import '../../../../core/presentation/router/app_router.dart';
import '../../../../core/presentation/utils/app_colors.dart';
import '../../../../core/presentation/utils/app_text_styles.dart';

class LocationSelectionPage extends StatefulWidget {
  const LocationSelectionPage({super.key});

  @override
  State<LocationSelectionPage> createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegionsBloc(
        getRegionsUseCase: GetRegionsUseCase(
          RegionRepositoryImpl(
            remoteDataSource: RegionRemoteDataSourceImpl(
              dio: context.read(),
            ),
          ),
        ),
        searchRegionsUseCase: SearchRegionsUseCase(
          RegionRepositoryImpl(
            remoteDataSource: RegionRemoteDataSourceImpl(
              dio: context.read(),
            ),
          ),
        ),
      )..add(LoadRegions()),
      child: _LocationSelectionContent(
        searchController: _searchController,
      ),
    );
  }
}

class _LocationSelectionContent extends StatefulWidget {
  final TextEditingController searchController;

  const _LocationSelectionContent({
    required this.searchController,
  });

  @override
  State<_LocationSelectionContent> createState() => _LocationSelectionContentState();
}

class _LocationSelectionContentState extends State<_LocationSelectionContent> {
  void _onSearchChanged(String query) {
    context.read<RegionsBloc>().add(SearchRegions(query));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final languageService = Provider.of<LanguageService>(context);
    
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        // Dismiss keyboard before popping
        FocusScope.of(context).unfocus();
      },
      child: GestureDetector(
        onTap: () {
          // Unfocus when tapping outside
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: AppColors.backgroundPrimary,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Header
                PandaHeader(
                  title: l10n.location,
                  onBackPressed: () {
                    // Dismiss keyboard before navigating back
                    FocusScope.of(context).unfocus();
                    context.pop();
                  },
                ),
                
                // Search Bar
                PandaSearchBar(
                  controller: widget.searchController,
                  hintText: l10n.search,
                  onChanged: _onSearchChanged,
                ),
                
                // Section Title
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Text(
                    l10n.selectRegion,
                    style: AppTextStyles.sectionTitle,
                  ),
                ),

                // Regions List
                Expanded(
                  child: BlocBuilder<RegionsBloc, RegionsState>(
                    builder: (context, state) {
                      if (state is RegionsLoading) {
                        return const RegionShimmer();
                      } else if (state is RegionsLoaded) {
                        return ListView.separated(
                          padding: EdgeInsets.only(bottom: 80.h),
                          itemCount: state.regions.length,
                          separatorBuilder: (context, index) => Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 24.w),
                            child: Divider(
                              color: AppColors.listDivider,
                              height: 1,
                              thickness: 1,
                            ),
                          ),
                          itemBuilder: (context, index) {
                            final region = state.regions[index];
                            return RegionListItem(
                              regionName: region.getNameByLanguage(
                                languageService.getLanguageCode(),
                              ),
                              onTap: () {
                                // Handle region selection
                                context.push(AppRoutes.login);
                              },
                            );
                          },
                        );
                      } else if (state is RegionsError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 48.sp,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                state.message,
                                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<RegionsBloc>().add(LoadRegions());
                                },
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 