import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget get progressIndicator => Platform.isAndroid
    ? const CircularProgressIndicator()
    : const CupertinoActivityIndicator();
