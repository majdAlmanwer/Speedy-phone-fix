// ignore_for_file: file_names

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationKeys = {
    'en': en,
    'se': se,
  };
}

final Map<String, String> en = {
  'Welcome!': 'Welcome!',
  'User Name': 'User Name',
  'Password': 'Password',
  'Sign In': 'Sign In',
  'Please Enter Full Name': 'Please Enter Full Name',
  'Full Name': 'Full Name',
  'Email': 'Email',
  'Please Enter Email': 'Please Enter Email',
  'Please Enter Valid Email': 'Please Enter Valid Email',
  'Please Enter Phone Number': 'Please Enter Phone Number',
  'Submit': 'Submit',
  'Terms of use & privacy policy': 'Terms of use & privacy policy',
  'Sign Up': 'Sign Up',
};
final Map<String, String> se = {
  'Welcome!': 'Välkommen!',
  'User Name': 'Användarnamn',
  'Password': 'Lösenord',
  'Sign In': 'Logga in',
  'Please Enter Full Name': 'Vänligen ange fullständigt namn',
  'Full Name': 'Fullständiga namn',
  'Email': 'E-post',
  'Please Enter Email': 'Vänligen ange e-post',
  'Please Enter Valid Email': 'Vänligen ange giltig e-post',
  'Please Enter Phone Number': 'Vänligen ange telefonnummer',
  'Submit': 'Skicka in',
  'Terms of use & privacy policy': 'Användarvillkor och sekretesspolicy',
  'Sign Up': 'Bli Medlem',
};
