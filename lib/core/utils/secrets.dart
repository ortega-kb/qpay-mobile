import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static String supabaseKey = dotenv.get('SUPABASE_KEY');
  static String supabaseUrl = dotenv.get('SUPABASE_URL');
}
