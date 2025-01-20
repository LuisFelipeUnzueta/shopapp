import 'package:dio/dio.dart';

import '../models/category_list_item.model.dart';
import '../settings.dart';

class CategoryRepository {
  final Dio _dio;

  // Injeção de dependência para facilitar testes e reuso
  CategoryRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<List<CategoryListItemModel>> getAll() async {
    final url = "${Settings.apiUrl}/categories";
    
    try {
      final response = await _dio.get(url);

      // Verifica se os dados retornados são uma lista
      if (response.data is List) {
        return (response.data as List)
            .map((category) => CategoryListItemModel.fromJson(category))
            .toList();
      } else {
        throw Exception("Dados retornados não são uma lista.");
      }
    } on DioException catch (e) {
      // Erros específicos do Dio
      throw Exception("Erro ao obter categorias: ${e.message}");
    } catch (e) {
      // Outros erros genéricos
      throw Exception("Erro inesperado: $e");
    }
  }
}
