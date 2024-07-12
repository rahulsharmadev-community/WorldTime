class DateTimeObject {
  /// The abbreviated name of the timezone
  final String? abbreviation;

  /// The IP address of the client making the request
  final String? clientIp;

  /// Representing the current, local date/time
  final DateTime? datetime;

  /// The week number of the current year
  final int? weekNumber;

  /// The day of the week as an integer (0-6, where 0 is Sunday and 6 is Saturday)
  final int? dayOfWeek;

  /// Ordinal date of the current year (1-365)
  final int? dayOfYear;

  /// flag indicating whether the local time is in daylight savings
  final bool? dst;

  /// Representing the datetime when daylight savings started for this timezone
  final DateTime? dstFrom;

  /// The difference in seconds between the current local time and daylight saving time for the location
  final int? dstOffset;

  /// Representing the datetime when daylight savings will end for this timezone
  final DateTime? dstUntil;

  /// The difference in seconds between the current local time and the time in UTC,
  /// excluding any daylight saving difference (see dst_offset)
  final int? rawOffset;

  /// Timezone in Area/Location or Area/Location/Region format
  final String? timezone;

  /// Number of seconds since the Epoch
  final int? unixtime;

  DateTimeObject({
    this.abbreviation,
    this.clientIp,
    this.datetime,
    this.dayOfWeek,
    this.dayOfYear,
    this.dst,
    this.dstFrom,
    this.dstOffset,
    this.dstUntil,
    this.rawOffset,
    this.timezone,
    this.unixtime,
    this.weekNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'abbreviation': abbreviation,
      'client_ip': clientIp,
      'datetime': datetime?.toIso8601String(),
      'day_of_week': dayOfWeek,
      'day_of_year': dayOfYear,
      'dst': dst,
      'dst_from': dstFrom,
      'dst_offset': dstOffset,
      'dst_until': dstUntil,
      'raw_offset': rawOffset,
      'timezone': timezone,
      'unixtime': unixtime,
      'week_number': weekNumber,
    };
  }

  factory DateTimeObject.fromJson(Map<String, dynamic> json) {
    final datetime = json['datetime'] != null ? DateTime.tryParse(json['datetime']) : null;
    final dstFrom = json['dst_from'] != null ? DateTime.tryParse(json['dst_from']) : null;
    final dstUntil = json['dst_until'] != null ? DateTime.tryParse(json['dst_until']) : null;
    return DateTimeObject(
      datetime: datetime,
      dstFrom: dstFrom,
      dstUntil: dstUntil,
      abbreviation: json['abbreviation'] as String?,
      clientIp: json['client_ip'] as String?,
      dayOfWeek: json['day_of_week'] as int?,
      dayOfYear: json['day_of_year'] as int?,
      dst: json['dst'] as bool?,
      dstOffset: json['dst_offset'] as int?,
      rawOffset: json['raw_offset'] as int?,
      timezone: json['timezone'] as String?,
      unixtime: json['unixtime'] as int?,
      weekNumber: json['week_number'] as int?,
    );
  }

  @override
  String toString() => toJson().toString();

  @override
  int get hashCode => Object.hash(abbreviation, clientIp, datetime, dayOfWeek, dayOfYear, dst, dstFrom,
      dstOffset, dstUntil, rawOffset, timezone, unixtime, weekNumber);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateTimeObject &&
          runtimeType == other.runtimeType &&
          abbreviation == other.abbreviation &&
          clientIp == other.clientIp &&
          datetime == other.datetime &&
          dayOfWeek == other.dayOfWeek &&
          dayOfYear == other.dayOfYear &&
          dst == other.dst &&
          dstFrom == other.dstFrom &&
          dstOffset == other.dstOffset &&
          dstUntil == other.dstUntil &&
          rawOffset == other.rawOffset &&
          timezone == other.timezone &&
          unixtime == other.unixtime &&
          weekNumber == other.weekNumber;
}
