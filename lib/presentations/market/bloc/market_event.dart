part of 'market_bloc.dart';

@freezed
class MarketEvent with _$MarketEvent {
  const factory MarketEvent.updateListOfSymbol(
    List<SymbolListResponseModel> list,
  ) = _UpdateListOfSymbol;

  const factory MarketEvent.updateScreenStatus(
    LoadingStatuses status,
  ) = _UpdateScreenStatus;
}
