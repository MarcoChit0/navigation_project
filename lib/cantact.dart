class Contact{
  final String _name, _genre, _cellphone, _email;
  Contact(this._name, this._cellphone, this._email, this._genre);
  get name =>this._name;
  get cellphone => this._cellphone;
  get email => this._email;
  get genre => this._genre;
}