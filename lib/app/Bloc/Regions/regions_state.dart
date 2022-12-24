part of 'regions_bloc.dart';

@immutable
class RegionsState {
  final List<State>? regions;

  const RegionsState({this.regions});
  RegionsState.fromJson(Map<String, dynamic> json) : regions = json['regions'];

  RegionsState copyWith({
    List<State>? regions,
  }) {
    return RegionsState(
      regions: regions ?? this.regions,
    );
  }

  @override
  List<Object?> get props => [
        regions,
      ];
}

class RegionsInitial extends RegionsState {}

class RegionsLoading extends RegionsState {}

class RegionsError extends RegionsState {}

class RegionsStateLoaded extends RegionsState {
  final RegionsState regionsState;
  const RegionsStateLoaded(this.regionsState);
}
