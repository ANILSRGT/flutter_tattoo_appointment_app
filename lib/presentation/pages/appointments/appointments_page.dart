import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';
import 'package:tattoo_appointment/presentation/widgets/fields/app_text_field.dart';

part 'appointments_page_mixin.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage>
    with AppointmentsPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return SingleChildScrollView(
      child: Padding(
        padding: context.ext.padding.all.lg,
        child: Column(
          children: [
            _appointmentPickerTitle,
            context.ext.sizedBox.height.md,
            _appointmentDatePicker,
            context.ext.sizedBox.height.sm,
            _appointmentTimePickerByDate,
            context.ext.sizedBox.height.sm,
            SizedBox(
              width: double.infinity,
              child: _appointmentGetButton,
            ),
            context.ext.sizedBox.height.sm,
            const Divider(),
            _buildAppointmentsList,
          ],
        ),
      ),
    );
  }

  Widget get _appointmentPickerTitle {
    return Text(
      LocalKeys.pagesAppointmentsSelectAppointmentTitle.appExt.locale.toTr,
      style: context.ext.theme.textTheme.titleLarge,
    );
  }

  Widget get _appointmentDatePicker {
    return AppTextField(
      controller: _dateFieldController,
      hintText: LocalKeys.pagesAppointmentsSelectAppointmentSelectDateFieldHint
          .appExt.locale.toTr,
      focusNode: _dateFieldFocusNode,
      keyboardType: TextInputType.none,
      readOnly: true,
      prefixIcon: const Icon(Icons.calendar_today_rounded),
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: _selectedAppointmentDate.value,
          firstDate: _initialDate,
          lastDate: _initialDate.add(const Duration(days: 7)),
          locale: WidgetsBinding.instance.platformDispatcher.locale,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          selectableDayPredicate: (date) {
            return date.weekday != DateTime.sunday &&
                date.weekday != DateTime.saturday;
          },
        );

        if (selectedDate != null) {
          _selectedAppointmentDate.value = selectedDate;
          _dateFieldController.text = _dateFieldFormattedText;
        }
      },
    );
  }

  Widget get _appointmentTimePickerByDate {
    return ValueListenableBuilder(
      valueListenable: _selectedAppointmentTime,
      builder: (_, value, __) {
        return Container(
          width: double.infinity,
          padding: context.ext.padding.all.sm,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: context.ext.radius.border.all.sm,
            border: Border.all(
              color: context.extApp.theme.currentThemeColor.grey.color,
            ),
          ),
          child: Wrap(
            spacing: context.ext.values.sm,
            children: [
              for (var i = 0; i < _dummyAppointmentTimes.length; i++)
                ChoiceChip(
                  label: Text(_dummyAppointmentTimes[i].format(context)),
                  selected: _dummyAppointmentTimes[i] == value,
                  showCheckmark: false,
                  onSelected: (selected) {
                    if (selected) {
                      _selectedAppointmentTime.value =
                          _dummyAppointmentTimes[i];
                      _dateFieldController.text = _dateFieldFormattedText;
                    }
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget get _appointmentGetButton {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        LocalKeys
            .pagesAppointmentsSelectAppointmentGetButton.appExt.locale.toTr,
      ),
    );
  }

  Widget get _buildAppointmentsList {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => context.ext.sizedBox.height.sm,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          title: Text('Appointment $index'),
          subtitle: Text('Appointment $index details'),
          trailing: const Icon(Icons.chevron_right_rounded),
          leading: AspectRatio(
            aspectRatio: 1,
            child: Material(
              borderRadius: context.ext.radius.border.all.sm,
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                ''.ext.random.imageSquare,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
