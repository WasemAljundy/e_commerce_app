import 'package:flutter/material.dart';
import 'package:ui_app/models/contact_info.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  String _gender = 'M';
  final List<ContactInfo> _contactInfo = <ContactInfo>[
    ContactInfo(title: 'Wasem', number: '0592463727'),
    ContactInfo(title: 'Hossam', number: '0597185334'),
    ContactInfo(title: 'Wesam', number: '0597744045'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: _notifications,
          onChanged: (bool value) => setState(() {
            _notifications = value;
          }),
          title: const Text('Notifications'),
          subtitle: const Text('Enable/Disable Notifications'),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Gender',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        RadioListTile<String>(
          contentPadding: EdgeInsets.zero,
          title: const Text('Male'),
          value: 'M',
          groupValue: _gender,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _gender = value;
              });
            }
          },
        ),
        RadioListTile<String>(
          contentPadding: EdgeInsets.zero,
          title: const Text('Female'),
          value: 'F',
          groupValue: _gender,
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                _gender = value;
              });
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Mobiles',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _contactInfo.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(
                _contactInfo[index].title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(_contactInfo[index].number),
              value: _contactInfo[index].selected,
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    _contactInfo[index].selected = value;
                  });
                }
              },
            );
          },
        )
      ],
    );
  }
}
