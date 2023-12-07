package com.hodoan.contacts_flutter


import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.provider.ContactsContract.CommonDataKinds.Phone
import android.provider.ContactsContract.Contacts
import android.util.Log
import androidx.core.app.ActivityCompat
import com.hodoan.contacts_flutter.ProtobufModel
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import java.util.*

import com.hodoan.contacts_flutter.ProtobufModel as pb

/** ContactsFlutterPlugin */
class ContactsFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.RequestPermissionsResultListener {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity
    private var resultReadContacts: Result? = null
    private var resultRequestPermission: Result? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "contacts_flutter")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getContacts" -> getContacts(result)
            "checkPermission" -> checkPermissionPlugin(result)
            "requestPermission" -> requestPermissionPlugin(result)
            else -> result.notImplemented()
        }
    }

    private fun requestPermissionPlugin(result: Result) {
        resultRequestPermission = result
        requestPermission()
    }

    private fun checkPermissionPlugin(result: Result) {
        val check = checkPermission()
        result.success(check)
    }

    private fun getContacts(result: Result) {
        if (!checkPermission()) {
            resultReadContacts = result
            requestPermission()
            return
        }
        val contacts = readContacts()
        result.success(contacts?.toByteArray())
    }

    @SuppressLint("Recycle")
    private fun readContacts(): pb.ContactListModel? {
        val properties = arrayOf(
            Phone.NUMBER,
            Contacts.DISPLAY_NAME,
        )
        val cts = mutableListOf<pb.ContactModel>()
        val contentResolver = context.contentResolver
        val cursor =
            contentResolver.query(
                Phone.CONTENT_URI,
                properties,
                null,
                null,
                Phone.DISPLAY_NAME + " ASC"
            )
        cursor ?: return null
        if (cursor.count < 1) {
            cursor.close()
            return null
        }

        val nameIndex = cursor.getColumnIndex(Contacts.DISPLAY_NAME)
        val numberIndex = cursor.getColumnIndex(Phone.NUMBER)

        while (cursor.moveToNext()) {
            val name = cursor.getString(nameIndex)
            val number = cursor.getString(numberIndex).replace(" ", "")
//            if (!cts.any { it.phonesList.contains(number) }) {
                if (cts.firstOrNull { it.name == name } != null) {
                    val index = cts.indexOfFirst { it.name == name }
                    val phones = cts[index].phonesList
                    cts[index] = pb.ContactModel.newBuilder()
                        .setName(name)
                        .addAllPhones(phones + number)
                        .build()
                } else {
                    cts += pb.ContactModel.newBuilder()
                        .setName(name)
                        .addAllPhones(listOf(number))
                        .build()
                }
//            }
        }
        cursor.close()
        return pb.ContactListModel.newBuilder().addAllContacts(cts).build()
//        return contacts
    }

    private fun checkPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            activity.checkSelfPermission(Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED
        } else {
            ActivityCompat.checkSelfPermission(
                context,
                Manifest.permission.READ_CONTACTS
            ) == PackageManager.PERMISSION_GRANTED
        }
    }

    private fun requestPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            activity.requestPermissions(arrayOf(Manifest.permission.READ_CONTACTS), 99)
        } else {
            ActivityCompat.requestPermissions(
                activity,
                arrayOf(Manifest.permission.READ_CONTACTS),
                99
            )
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addRequestPermissionsResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

    override fun onDetachedFromActivity() {}

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ): Boolean {
        Log.e(
            ContactsFlutterPlugin::class.simpleName,
            "onRequestPermissionsResult: $requestCode,${grantResults[0]}"
        )
        when (requestCode) {
            99 -> {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    resultRequestPermission?.success(true)
                    resultReadContacts?.let {
                        val contacts = readContacts()
                        it.success(contacts?.toByteArray())
                    }
                } else {
                    resultRequestPermission?.success(false)
                }
                resultReadContacts = null
                resultRequestPermission = null
            }
        }
        return true
    }
}
