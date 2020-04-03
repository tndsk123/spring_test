package com.example.test.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DiffDate{

  public static long diffOfDate(String begin, String end) throws Exception{
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
    Date beginDate = formatter.parse(begin);
    Date endDate = formatter.parse(end);
    long diff = endDate.getTime() - beginDate.getTime();
    long diffDays = diff / (24 * 60 * 60 * 1000);
    return diffDays;
  }
}
