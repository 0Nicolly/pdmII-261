import 'package:http/http.dart' as http;
import '../models/disco.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DiscogsService {
  final String _token = dotenv.env['DISCOGS_TOKEN'] ?? '';
  final String _userAgent = dotenv.env['USER_AGENT'] ?? '';

  Future<List<Disco>> buscarVinis(String query) async {
    final url = Uri.parse('https://api.discogs.com/database/search?q=$query');

    final response = await http.get(
      url,
      headers: {
        'User-Agent': _userAgent,
        'Authorization': 'Discogs token=$_token',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List results = data['results'];
      return results.map((item) => Disco.fromJson(item)).toList();

    } else {
      throw Exception('Falha ao carregar discos');
    }
  }
}