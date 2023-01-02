class HistoryInjectionModel {
  final DateTime timeInjection;
  final bool isPay;
  final String bookingCode;
  final String vaccineName;
  final double total;
  final DateTime appointmentDate;

  const HistoryInjectionModel(this.timeInjection, this.isPay, this.bookingCode,
      this.vaccineName, this.appointmentDate, this.total);
}
