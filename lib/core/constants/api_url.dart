class ApiUrl {
  static const baseURL = 'https://api.themoviedb.org';
  static const imageBaseURL = 'https://image.tmdb.org/t/p/w500';
  static const apiV = '3';

  static const APiKey =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmY4OWJjNDUwMjFmODc2MjEyOGU0MDFhM2ZmOTNlNCIsIm5iZiI6MTYyMDM1OTcwMi4zOTEsInN1YiI6IjYwOTRiYTE2MjdmZjk5MDAzZWVhMWRhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vvk_6aPchXHfk_Dw27pZJrQ79iCkXxlUCAplsZnMaF0";

  // Auth
  static const signup =
      'https://685e530d7b57aebd2af8f1f9.mockapi.io/api/v1/user';
  static const signin =
      'https://685e530d7b57aebd2af8f1f9.mockapi.io/api/v1/user';

  // Movie
  static const trendingMovies =
      '$baseURL/$apiV/trending/movie/day?language=en-US';

  static const nowPlayingMovies = '$baseURL/$apiV/movie/now_playing';

  static const getMovieTrailerById = '$baseURL/$apiV/movie/{movie_id}/videos';

  static const getRecommendedMoviesById =
      '$baseURL/$apiV/movie/{movie_id}/recommendations';

  static const getSimilarMoviesById = '$baseURL/$apiV/movie/{movie_id}/similar';

  static const getMovieKeyWordById = '$baseURL/$apiV/movie/{movie_id}/keywords';

  // TV
  static const trendingTvs = '$baseURL/$apiV/trending/tv/day?language=en-US';

  static const getTvTrailerById = '$baseURL/$apiV/tv/{tv_id}/videos';

  static const getRecommendedTvsById =
      '$baseURL/$apiV/tv/{tv_id}/recommendations';

  static const getSimilarTvsById = '$baseURL/$apiV/tv/{tv_id}/similar';

  static const getTvKeyWordById = '$baseURL/$apiV/tv/{tv_id}/keywords';




  static const search = '${apiV}search/';


}
