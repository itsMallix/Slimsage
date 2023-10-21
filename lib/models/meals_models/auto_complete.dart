class SearchAutoComplete {
  final String id;
  final String name;
  final String image;

  SearchAutoComplete({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SearchAutoComplete.fromJson(json) {
    return SearchAutoComplete(
      id: json['id'] as String,
      name: json['title'] as String,
      image:
          "https://spoonacular.com/recipeImages/${json['id']}-556x370.${json['imageType']}",
    );
  }
}

class SearchAutoCompleteList {
  final List<SearchAutoComplete> autoCompleteList;

  SearchAutoCompleteList({required this.autoCompleteList});

  factory SearchAutoCompleteList.fromJson(List<dynamic> json) {
    return SearchAutoCompleteList(
      autoCompleteList:
          json.map((e) => SearchAutoComplete.fromJson(e)).toList(),
    );
  }
}
