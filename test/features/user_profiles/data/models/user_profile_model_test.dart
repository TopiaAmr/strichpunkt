import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:strichpunkt/features/user_profiles/data/models/user_profile_model.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

/// Tests for the [UserProfileModel] class.
///
/// These tests verify that the [UserProfileModel] correctly:
/// - Extends the [UserProfile] entity
/// - Converts from JSON to model instances
/// - Converts from model instances to JSON
/// - Handles different profile status values
void main() {
  final tUserProfileModel = UserProfileModel(
    id: '1',
    name: 'Matthew Brian',
    svnNumber: '123 456 789',
    avatarUrl: 'assets/images/avatar1.png',
    relation: 'Me',
    status: ProfileStatus.verified,
    connectCount: 2,
    medicineCount: 11,
    consultCount: 2,
    isCurrentlyInUse: true,
    showBorder: false,
    borderColor: Colors.transparent,
  );

  /// Verifies that [UserProfileModel] is a subclass of [UserProfile].
  test('should be a subclass of UserProfile entity', () {
    // Assert
    expect(tUserProfileModel, isA<UserProfile>());
  });

  group('fromJson', () {
    /// Tests that [UserProfileModel.fromJson] correctly parses a valid JSON structure.
    test(
      'should return a valid model when the JSON has the correct structure',
      () {
        // Arrange
        final Map<String, dynamic> jsonMap = {
          'id': '1',
          'name': 'Matthew Brian',
          'svnNumber': '123 456 789',
          'avatarUrl': 'assets/images/avatar1.png',
          'relation': 'Me',
          'status': 'verified',
          'connectCount': 2,
          'medicineCount': 11,
          'consultCount': 2,
          'isCurrentlyInUse': true,
          'showBorder': false,
          'borderColor': 0x00000000,
        };

        // Act
        final result = UserProfileModel.fromJson(jsonMap);

        // Assert
        expect(result, tUserProfileModel);
      },
    );

    /// Tests that [UserProfileModel.fromJson] correctly parses different status values.
    ///
    /// This test verifies:
    /// - 'verified' is parsed as [ProfileStatus.verified]
    /// - 'unverified' is parsed as [ProfileStatus.unverified]
    /// - 'pending' is parsed as [ProfileStatus.pending]
    /// - Unknown values default to [ProfileStatus.unverified]
    test(
      'should return the correct status when parsing different status values',
      () {
        // Arrange
        // Case 1: verified
        final Map<String, dynamic> verifiedJson = {
          'id': '1',
          'name': 'Test',
          'svnNumber': '123',
          'avatarUrl': 'test.png',
          'relation': 'Test',
          'status': 'verified',
          'connectCount': 0,
          'medicineCount': 0,
          'consultCount': 0,
          'isCurrentlyInUse': false,
          'showBorder': false,
          'borderColor': 0,
        };

        // Case 2: unverified
        final Map<String, dynamic> unverifiedJson = {
          'id': '1',
          'name': 'Test',
          'svnNumber': '123',
          'avatarUrl': 'test.png',
          'relation': 'Test',
          'status': 'unverified',
          'connectCount': 0,
          'medicineCount': 0,
          'consultCount': 0,
          'isCurrentlyInUse': false,
          'showBorder': false,
          'borderColor': 0,
        };

        // Case 3: pending
        final Map<String, dynamic> pendingJson = {
          'id': '1',
          'name': 'Test',
          'svnNumber': '123',
          'avatarUrl': 'test.png',
          'relation': 'Test',
          'status': 'pending',
          'connectCount': 0,
          'medicineCount': 0,
          'consultCount': 0,
          'isCurrentlyInUse': false,
          'showBorder': false,
          'borderColor': 0,
        };

        // Case 4: unknown (should default to unverified)
        final Map<String, dynamic> unknownJson = {
          'id': '1',
          'name': 'Test',
          'svnNumber': '123',
          'avatarUrl': 'test.png',
          'relation': 'Test',
          'status': 'unknown',
          'connectCount': 0,
          'medicineCount': 0,
          'consultCount': 0,
          'isCurrentlyInUse': false,
          'showBorder': false,
          'borderColor': 0,
        };

        // Act
        final verifiedResult = UserProfileModel.fromJson(verifiedJson);
        final unverifiedResult = UserProfileModel.fromJson(unverifiedJson);
        final pendingResult = UserProfileModel.fromJson(pendingJson);
        final unknownResult = UserProfileModel.fromJson(unknownJson);

        // Assert
        expect(verifiedResult.status, ProfileStatus.verified);
        expect(unverifiedResult.status, ProfileStatus.unverified);
        expect(pendingResult.status, ProfileStatus.pending);
        expect(unknownResult.status, ProfileStatus.unverified); // Default case
      },
    );
  });

  group('toJson', () {
    /// Tests that [UserProfileModel.toJson] correctly converts the model to JSON.
    test('should return a JSON map containing the proper data', () {
      // Act
      final result = tUserProfileModel.toJson();

      // Assert
      final expectedMap = {
        'id': '1',
        'name': 'Matthew Brian',
        'svnNumber': '123 456 789',
        'avatarUrl': 'assets/images/avatar1.png',
        'relation': 'Me',
        'status': 'verified',
        'connectCount': 2,
        'medicineCount': 11,
        'consultCount': 2,
        'isCurrentlyInUse': true,
        'showBorder': false,
        'borderColor': Colors.transparent,
      };

      expect(result['id'], expectedMap['id']);
      expect(result['name'], expectedMap['name']);
      expect(result['status'], expectedMap['status']);
      // Add additional assertions for other fields if needed
    });

    /// Tests that [UserProfileModel.toJson] correctly converts different status values to strings.
    test('should convert all status types correctly', () {
      // Arrange
      final verifiedProfile = UserProfileModel(
        id: '1',
        name: 'Test',
        svnNumber: '123',
        avatarUrl: 'test.png',
        relation: 'Test',
        status: ProfileStatus.verified,
        connectCount: 0,
        medicineCount: 0,
        consultCount: 0,
        isCurrentlyInUse: false,
      );

      final unverifiedProfile = UserProfileModel(
        id: '1',
        name: 'Test',
        svnNumber: '123',
        avatarUrl: 'test.png',
        relation: 'Test',
        status: ProfileStatus.unverified,
        connectCount: 0,
        medicineCount: 0,
        consultCount: 0,
        isCurrentlyInUse: false,
      );

      final pendingProfile = UserProfileModel(
        id: '1',
        name: 'Test',
        svnNumber: '123',
        avatarUrl: 'test.png',
        relation: 'Test',
        status: ProfileStatus.pending,
        connectCount: 0,
        medicineCount: 0,
        consultCount: 0,
        isCurrentlyInUse: false,
      );

      // Act
      final verifiedJson = verifiedProfile.toJson();
      final unverifiedJson = unverifiedProfile.toJson();
      final pendingJson = pendingProfile.toJson();

      // Assert
      expect(verifiedJson['status'], 'verified');
      expect(unverifiedJson['status'], 'unverified');
      expect(pendingJson['status'], 'pending');
    });
  });
}
