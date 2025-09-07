enum ApiPath {
  notes,
}

extension ApiPathExtension on ApiPath {
  String path({Map<String, String>? params}) {
    switch (this) {
      case ApiPath.notes:
        if (params?.isNotEmpty ?? false) {
          return '/notes/${params?['id']}';
        }
        return '/notes';
    }
  }
}
