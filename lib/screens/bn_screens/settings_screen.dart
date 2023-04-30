import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_app/models/address.dart';
import 'package:ui_app/models/contact_info.dart';
import 'package:ui_app/provider/app_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _gender = 'M';
  final List<ContactInfo> _contactInfo = <ContactInfo>[
    ContactInfo(title: 'Wasem', number: '0592463727'),
    ContactInfo(title: 'Hossam', number: '0597185334'),
    ContactInfo(title: 'Wesam', number: '0597744045'),
  ];

  final List<Address> _addresses = [
    const Address(id: 1, name: 'Gaza'),
    const Address(id: 2, name: 'Rafah'),
    const Address(id: 3, name: 'Khanyounis'),
    const Address(id: 4, name: 'Al-Borayj'),
  ];

  int? _selectedAddress;

  late TextEditingController _tagTextController;
  final List<String> _tags = [];

  @override
  void initState() {
    super.initState();
    _tagTextController = TextEditingController();
  }

  @override
  void dispose() {
    _tagTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: Provider.of<LanguageProvider>(context).darkTheme,
          onChanged: (bool value) => setState(() {
            Provider.of<LanguageProvider>(context, listen: false).changeTheme();
          }),
          title: const Text('Dark Mode'),
          subtitle: const Text('Enable/Disable Dark Mode Theme'),
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
                style: const TextStyle(fontSize: 18),
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
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Address',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        DropdownButton(
          isExpanded: true,
          onTap: () {},
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _selectedAddress = value;
              });
            }
          },
          value: _selectedAddress,
          items: _addresses.map((e) {
            return DropdownMenuItem(
              value: e.id,
              child: Text(e.name),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Tags',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextField(
          controller: _tagTextController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Enter Tag Name',
            suffixIcon: IconButton(
              onPressed: () => addTag(),
              icon: const Icon(Icons.save),
            ),
          ),
        ),
        Wrap(
          spacing: 10,
          // crossAxisAlignment: WrapCrossAlignment.center,
          // runAlignment: WrapAlignment.center,
          children: _tags
              .map(
                (e) => Chip(
                  label: Text(e, style: const TextStyle(fontSize: 15, color: Colors.black)),
                  backgroundColor: Colors.white,
                  elevation: 5,
                  deleteIcon: const Icon(Icons.close),
                  deleteIconColor: Colors.red,
                  onDeleted: () => deleteTag(e),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.lightBlue,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void addTag() {
    if (_tagTextController.text.isNotEmpty) {
      setState(() {
        _tags.add(_tagTextController.text);
        _tagTextController.text = '';
      });
    }
  }

  void deleteTag(String tag) {
    setState(() {
      _tags.removeWhere((element) => element == tag);
    });
  }
}
