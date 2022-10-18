

class Url{
   // this is our base Url
  static String baseUrl = 'https://disease.sh/v3/covid-19/';

  // fetch world covid state

  static String worldStateApi = '${baseUrl}all';

  static String countryList = '${baseUrl}countries';
}