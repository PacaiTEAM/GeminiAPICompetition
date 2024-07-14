import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:gemini_app/services/permissions/microphone.dart';
import 'package:speech_to_text/speech_to_text.dart';

// Annotation which generates the related classes and library.
@GenerateNiceMocks([MockSpec<SpeechToText>(), MockSpec<Microphone>()])
import "microphone_test.mocks.dart";

void main() {
  group('Microphone Service test', () {
    late Microphone microphone;
    late MockSpeechToText mockSpeech;

    setUp(() {
      microphone = Microphone();
      mockSpeech = MockSpeechToText();
      microphone.speech = mockSpeech;
      resetMockitoState();
    });

    tearDown(() {
      reset(mockSpeech);
    });

    group("getPermission method", () {
      test("should return false if speech initialization failed", () async {
        when(mockSpeech.initialize(
          onStatus: anyNamed("onStatus"),
          onError: anyNamed("onError"),
        )).thenAnswer((_) async => false);

        expect(await microphone.getPermission(), isFalse);
      });

      test("should return true if speech initialization is successful",
          () async {
        when(mockSpeech.initialize(
          onStatus: anyNamed("onStatus"),
          onError: anyNamed("onError"),
        )).thenAnswer((_) async => true);

        expect(await microphone.getPermission(), isTrue);
      });
    });

    group("hasPermission method", () {
      test(
          'should return false when either isAvailable and hasPermission is false',
          () async {
        when(mockSpeech.isAvailable).thenReturn(false);
        when(mockSpeech.hasPermission).thenAnswer((_) async => false);
        expect(await microphone.hasPermission(), isFalse);

        when(mockSpeech.isAvailable).thenReturn(false);
        when(mockSpeech.hasPermission).thenAnswer((_) async => true);
        expect(await microphone.hasPermission(), isFalse);

        when(mockSpeech.isAvailable).thenReturn(true);
        when(mockSpeech.hasPermission).thenAnswer((_) async => false);
        expect(await microphone.hasPermission(), isFalse);
      });

      test(
          'should return false when both isAvailable and hasPermission is true',
          () async {
        when(mockSpeech.isAvailable).thenReturn(true);
        when(mockSpeech.hasPermission).thenAnswer((_) async => true);

        expect(await microphone.hasPermission(), isTrue);
      });
    });

    group("getInput method", () {
      test('should listen if permission granted', () async {
        microphone.getInput(true);
        verify(mockSpeech.listen(
                onResult: anyNamed("onResult"),
                listenOptions: anyNamed("listenOptions")))
            .called(1);
      });

      test('should not listen if not permission granted', () async {
        microphone.getInput(false);
        verifyNever(mockSpeech.listen());
      });
    });
  });
}
