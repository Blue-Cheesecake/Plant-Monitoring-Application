class DetectedData {
  final DateTime? detectedAt;
  final double? humidity;
  final double? temperature;

  DetectedData(this.detectedAt, this.humidity, this.temperature);

  factory DetectedData.fromJson(Map<String, dynamic> json) {
    return DetectedData(
      json['detectedAt'].toDate(),
      double.tryParse(json['humidity'].toString()),
      double.tryParse(json['temperature'].toString()),
    );
  }

  String get formattedDetectedAt {
    if (detectedAt == null) {
      return "";
    }
    if (detectedAt!.minute < 10) {
      return "${detectedAt?.hour}.0${detectedAt?.minute}";
    }
    return "${detectedAt?.hour}.${detectedAt?.minute}";
  }

  @override
  String toString() {
    return "(humidity: $humidity, temperature: $temperature)";
  }
}
