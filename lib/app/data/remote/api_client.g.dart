// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://www.themealdb.com/api/json/v1/1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CategoriesResponse> getCategories() async {
    final _result = await _dio.get<Map<String, dynamic>>(
      '/categories.php',
    );
    final value = CategoriesResponse.fromJson(_result.data!);
    return value;
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponse _$CategoriesResponseFromJson(Map<String, dynamic> json) {
  return CategoriesResponse(
    categories: (json['categories'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoriesResponseToJson(CategoriesResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    idCategory: json['idCategory'] as String,
    strCategory: json['strCategory'] as String,
    strCategoryThumb: json['strCategoryThumb'] as String,
    strCategoryDescription: json['strCategoryDescription'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'idCategory': instance.idCategory,
  'strCategory': instance.strCategory,
  'strCategoryThumb': instance.strCategoryThumb,
  'strCategoryDescription': instance.strCategoryDescription,
};
