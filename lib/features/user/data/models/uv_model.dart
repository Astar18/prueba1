class UvData {
  final double uvIndex;
  final String timezoneName;
  final String time;

  UvData({
    required this.uvIndex,
    required this.timezoneName,
    required this.time,
  });

  factory UvData.fromJson(Map<String, dynamic> json) {
    return UvData(
      // Acceder al json now uv_index
      uvIndex: (json['now']['uv_index'] as num).toDouble(),
      // Acceder al json timezone name
      timezoneName: json['timezone']['name'],
      // Acceder al json now time hora del reporte
      time: json['now']['time'],
    );
  }
}