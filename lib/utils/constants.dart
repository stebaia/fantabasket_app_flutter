class Constants {
  const Constants._();

  static const userKey = 'CURRENT_USER';
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const baseUrl = "http://192.168.1.107:7000/api/";

  static List<String> categoryCar = [
    'Berlina',
    'Suv',
    'City Car',
    'Fuoristrada',
    'Station Wagon',
    'Minivan'
  ];
}
