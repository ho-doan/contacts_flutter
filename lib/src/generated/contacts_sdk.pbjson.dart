//
//  Generated code. Do not modify.
//  source: contacts_sdk.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use contactModelDescriptor instead')
const ContactModel$json = {
  '1': 'ContactModel',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phones', '3': 2, '4': 3, '5': 9, '10': 'phones'},
  ],
};

/// Descriptor for `ContactModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactModelDescriptor = $convert.base64Decode(
    'CgxDb250YWN0TW9kZWwSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZwaG9uZXMYAiADKAlSBnBob2'
    '5lcw==');

@$core.Deprecated('Use contactListModelDescriptor instead')
const ContactListModel$json = {
  '1': 'ContactListModel',
  '2': [
    {'1': 'contacts', '3': 1, '4': 3, '5': 11, '6': '.ContactModel', '10': 'contacts'},
  ],
};

/// Descriptor for `ContactListModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactListModelDescriptor = $convert.base64Decode(
    'ChBDb250YWN0TGlzdE1vZGVsEikKCGNvbnRhY3RzGAEgAygLMg0uQ29udGFjdE1vZGVsUghjb2'
    '50YWN0cw==');

