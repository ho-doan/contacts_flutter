//
//  Generated code. Do not modify.
//  source: contacts_sdk.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ContactModel extends $pb.GeneratedMessage {
  factory ContactModel({
    $core.String? name,
    $core.Iterable<$core.String>? phones,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (phones != null) {
      $result.phones.addAll(phones);
    }
    return $result;
  }
  ContactModel._() : super();
  factory ContactModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactModel', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pPS(2, _omitFieldNames ? '' : 'phones')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactModel clone() => ContactModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactModel copyWith(void Function(ContactModel) updates) => super.copyWith((message) => updates(message as ContactModel)) as ContactModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactModel create() => ContactModel._();
  ContactModel createEmptyInstance() => create();
  static $pb.PbList<ContactModel> createRepeated() => $pb.PbList<ContactModel>();
  @$core.pragma('dart2js:noInline')
  static ContactModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactModel>(create);
  static ContactModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get phones => $_getList(1);
}

class ContactListModel extends $pb.GeneratedMessage {
  factory ContactListModel({
    $core.Iterable<ContactModel>? contacts,
  }) {
    final $result = create();
    if (contacts != null) {
      $result.contacts.addAll(contacts);
    }
    return $result;
  }
  ContactListModel._() : super();
  factory ContactListModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContactListModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContactListModel', createEmptyInstance: create)
    ..pc<ContactModel>(1, _omitFieldNames ? '' : 'contacts', $pb.PbFieldType.PM, subBuilder: ContactModel.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContactListModel clone() => ContactListModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContactListModel copyWith(void Function(ContactListModel) updates) => super.copyWith((message) => updates(message as ContactListModel)) as ContactListModel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContactListModel create() => ContactListModel._();
  ContactListModel createEmptyInstance() => create();
  static $pb.PbList<ContactListModel> createRepeated() => $pb.PbList<ContactListModel>();
  @$core.pragma('dart2js:noInline')
  static ContactListModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContactListModel>(create);
  static ContactListModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ContactModel> get contacts => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
