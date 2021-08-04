import 'package:flutter/material.dart';
import 'package:navigation_project/cantact.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: NewContact(),
    );
  }
}

class NewContact extends StatefulWidget {
  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final _genders = ['Male', 'Female', 'Other']
      .map((e) => DropdownMenuItem(
            child: Text(e),
            value: e[0] != 'O' ? e[0] : 'U',
          ))
      .toList();
  final _formKey = GlobalKey<FormState>();

  String? _gender = null;
  late String _name, _phone, _email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Center(
          child: Container(
              width: 300,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Empty required field';

                            return null;
                          },
                          onChanged: (value) => setState(() => _name = value),
                          decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.person)
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          validator: (value) {
                            RegExp exp = RegExp(
                                r'^(\+[0-9]{2} )?(\(?[0-9]{2}\)? )?[0-9]{4,5}-?[0-9]{4}$');

                            if (value == null || value.isEmpty)
                              return 'Empty required field';
                            else if (!exp.hasMatch(value))
                              return 'Invalid phone number';

                            return null;
                          },
                          onChanged: (value) => setState(() => _phone = value),
                          decoration: InputDecoration(
                              labelText: 'Cell Phone',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.phone_android)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          validator: (value) {
                            RegExp exp = RegExp(r'^.+@.+\..+$');

                            if (value == null || value.isEmpty)
                              return 'Empty required field';
                            else if (!exp.hasMatch(value)) return 'Invalid email';

                            return null;
                          },
                          onChanged: (value) => setState(() => _email = value),
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.mail)),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) return 'Empty required field';

                              return null;
                            },
                            hint: Text('Gender'),
                            items: _genders,
                            value: _gender,
                            onChanged: (value) =>
                                setState(() => _gender = value.toString()),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: Text('Add new Contact'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var newContact = Contact(
                                  _name,
                                  _phone,
                                  _email,
                                  _gender.toString()
                              );

                              print(newContact);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
              ))),
    );
  }
}
