part of 'market_bloc.dart';

@freezed
class MarketState with _$MarketState {
  const factory MarketState({
    @Default([]) List<SymbolListResponseModel> allSymbolList,
    @Default(LoadingStatuses.idl) LoadingStatuses loadingStatus,
  }) = _MarketState;
}
