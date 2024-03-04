import 'package:http/http.dart' as http;

class FetchData {
  fetchDataFromApi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':
              'FibEFjSnOKT24ereH472YjWE08JOz9fElYOo5EAQACHtw7KNgHzgz2PD'
        }).then((value) {
      print(value.body);
    });
  }
}
