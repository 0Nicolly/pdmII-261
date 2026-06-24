class Disco {
  final int id;
  final String titulo;
  final String ano;
  final String capaUrl;

  Disco({
    required this.id,
    required this.titulo,
    required this.ano,
    required this.capaUrl,
  });

  factory Disco.fromJson(Map<String, dynamic> json) {
    return Disco(
      id: json['id'],
      titulo: json['title'] ?? 'Título desconhecido',
      ano: json['year'] ?? 'N/A',
      capaUrl: json['cover_image'] ?? '',
    );
  }
}