part of 'appointments_page.dart';

mixin AppointmentsPageMixin on State<AppointmentsPage> {
  final _dateFieldController = TextEditingController();
  final _dateFieldFocusNode = FocusNode();

  final _initialDate = DateTime.now().toUtc().add(const Duration(days: 3));
  late final ValueNotifier<DateTime> _selectedAppointmentDate;

  // TODO: Replace this with actual appointment times
  final _dummyAppointmentTimes = <TimeOfDay>[
    const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 11, minute: 0),
    const TimeOfDay(hour: 13, minute: 0),
    const TimeOfDay(hour: 15, minute: 0),
    const TimeOfDay(hour: 17, minute: 0),
  ];
  late final ValueNotifier<TimeOfDay> _selectedAppointmentTime;

  String get _dateFieldFormattedText => '${DateFormat(
        'dd/MM/yyyy',
      ).format(_selectedAppointmentDate.value)}\t${_selectedAppointmentTime.value.format(context)}';

  @override
  void initState() {
    super.initState();
    _selectedAppointmentDate = ValueNotifier(_initialDate);
    // TODO: Replace this with actual appointment times
    _selectedAppointmentTime = ValueNotifier(_dummyAppointmentTimes.first);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dateFieldController.text = _dateFieldFormattedText;
  }

  @override
  void dispose() {
    _dateFieldController.dispose();
    _dateFieldFocusNode.dispose();
    _selectedAppointmentDate.dispose();
    _selectedAppointmentTime.dispose();
    _dummyAppointmentTimes.clear();
    super.dispose();
  }
}
