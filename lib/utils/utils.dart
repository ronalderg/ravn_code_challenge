import 'package:flutter/material.dart';
import 'dart:convert';

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

int getIdFromUrl(String url){
  List<String> urlSplit = url.split('/');
  urlSplit.removeLast();
  return int.parse(urlSplit.last);
}