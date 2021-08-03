import 'dart:math';

class Contact{
  final String _name, _genre, _cellphone, _email;
  Contact(this._name, this._cellphone, this._email, this._genre);
  get name => this._name;
  get cellphone => this._cellphone;
  get email => this._email;
  get genre => this._genre;

  List<Contact> randomList(int n) {
    Random random = Random();
    var genders = ['M', 'F', 'U'];

    return List.generate(n, (i) => Contact(
        'person $i',
        [
          List.generate(4, (index) => random.nextInt(10)).join(''), 
          List.generate(4, (index) => random.nextInt(10)).join('')
        ].join('-'),
        'person$i@mail.com',
        genders[random.nextInt(genders.length)]
    ));
  }
}