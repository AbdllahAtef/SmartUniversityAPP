import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/models/ai_analysis_model.dart';
import 'package:smart_university_app/utils/services/ai_analysis_services.dart';

final aiAnalysisServiceProvider = Provider((ref) => AiAnalysisService());

final aiAnalysisProvider = FutureProvider<AiAnalysisModel>((ref) async {
  final service = ref.read(aiAnalysisServiceProvider);

  return service.getAnalysis();
});
