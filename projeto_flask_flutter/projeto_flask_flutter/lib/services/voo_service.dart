import 'dart:convert';
import 'package:http/http.dart' as http;

class VooService {
  Future<List<dynamic>> fetchVoos(String aeroporto, String tipo) async {
    final url = Uri.parse('http://127.0.0.1:5001/api/voos?aeroporto=$aeroporto&tipo=$tipo');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data is List ? data : (data['voos'] ?? []);
    } else {
      throw Exception('Erro ao carregar voos');
    }
  }
}