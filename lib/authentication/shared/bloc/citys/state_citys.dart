abstract class CountryFetchState {}

class CountryFetchIniti extends CountryFetchState {}

class CountryFetchLoading extends CountryFetchState {}

class CountryFetchLoaded extends CountryFetchState {
  // final List <Country>countrylist;

  // CountryFetchLoaded(this.countrylist);
}

class CountryFetchErorr extends CountryFetchState {}

class CountryFetchSuSuccess extends CountryFetchState {}
