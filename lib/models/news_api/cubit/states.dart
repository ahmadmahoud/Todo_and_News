abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String erroe ;
  NewsGetBusinessErrorState(this.erroe);
}


class ChangeModeThemeIconApp extends NewsStates {}

class ChangeModeThemeApp extends NewsStates {}


class NewsLoadingScienceState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsLoadingSportsState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String erroe ;
  NewsGetSportsErrorState(this.erroe);
}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String erroe ;
  NewsGetScienceErrorState(this.erroe);
}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsLoadingSearchState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String erroe ;
  NewsGetSearchErrorState(this.erroe);
}




