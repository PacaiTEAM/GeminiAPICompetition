// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'package:gemini_app/services/permissions/microphone.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// // Annotation which generates the related classes and library.
// @GenerateNiceMocks([MockSpec<SpeechToText>(), MockSpec<Permission>()])
// import "microphone_test.mocks.dart";

void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   group('Microphone Service test', () {
//     late Microphone microphone;
//     late MockSpeechToText mockSpeech;
//     late MockPermission mockPermission;

//     setUp(() {
//       microphone = Microphone();
//       mockSpeech = MockSpeechToText();
//       microphone.speech = mockSpeech;
//       mockPermission = MockPermission();
//       resetMockitoState();
//     });

//     tearDown(() {
//       reset(mockSpeech);
//     });

//     group("getPermission method", () {
//       test("should return false if speech initialization failed", () async {
//         when(mockPermission.isGranted).thenAnswer((_) async => false);
//         when(mockPermission.request())
//             .thenAnswer((_) async => PermissionStatus.denied);

//         expect(await microphone.getPermission(), isFalse);
//       });

//       test("should return true if speech initialization is successful",
//           () async {
//         when(mockPermission.isGranted).thenAnswer((_) async => false);
//         when(mockPermission.request())
//             .thenAnswer((_) async => PermissionStatus.granted);

//         expect(await microphone.getPermission(), isTrue);
//       });
//     });

//     group("hasPermission method", () {
//       test('should return false when microphone permissions are denied',
//           () async {
//         when(mockPermission.status)
//             .thenAnswer((_) async => PermissionStatus.denied);
//         expect(await microphone.hasPermission(), isFalse);
//       });

//       test('should return true when microphone permissions are granted',
//           () async {
//         when(mockPermission.status)
//             .thenAnswer((_) async => PermissionStatus.granted);
//         expect(await microphone.hasPermission(), isTrue);
//       });
//     });

//     group("getInput method", () {
//       test('should listen if permission granted', () async {
//         microphone.getInput();
//         verify(mockSpeech.listen(
//                 onResult: anyNamed("onResult"),
//                 listenOptions: anyNamed("listenOptions")))
//             .called(1);
//       });

//       test('should not listen if not permission granted', () async {
//         microphone.getInput();
//         verifyNever(mockSpeech.listen());
//       });
//     });
//   });
}
