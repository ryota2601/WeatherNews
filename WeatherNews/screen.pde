void screen() {

  stroke(0);
  time.string(nf(hour(), 2)+":"+nf(minute(), 2)+":"+nf(second(), 2));
  date.string(year() + "/" + month() + "/" + day());
  String e = "室温/" + temp3;
  ctemp.string(e);
  title.string((day())+ "日の天気予報");

  image(map, mapX, mapY, 700, 700);

  for (int i=0; i<14; i++) {
    weather[i].shape();
    Htemparature[i].string(Htemp[i+1]);
    Ltemparature[i].string(Ltemp[i+1]);
  }

  robot.anime();

  for (int i=0; i<14; i++) {
    if (weather[i].read == true) {
      robot.stop_decide();
      robot.move();
      if (moving % 4 == 2) {
        chimei_read[i].play();
        result[0].play();
        if (W[i+1].equals("晴れ")) {
          result[4].play();
        } else if (W[i+1].equals("晴のち曇")) {
          result[5].play();
        } else if (W[i+1].equals("晴時々曇")) {
          result[6].play();
        } else if (W[i+1].equals("曇のち晴")) {
          result[7].play();
        } else if (W[i+1].equals("曇時々晴")) {
          result[8].play();
        } else if (W[i+1].equals("曇り")) {
          result[9].play();
        } else if (W[i+1].equals("晴のち雨")) {
          result[10].play();
        } else if (W[i+1].equals("晴時々雨")) {
          result[11].play();
        } else if (W[i+1].equals("雨のち晴")) {
          result[12].play();
        } else if (W[i+1].equals("雨時々晴")) {
          result[13].play();
        } else if (W[i+1].equals("雨のち曇")) {
          result[14].play();
        } else if (W[i+1].equals("雨時々曇")) {
          result[15].play();
        } else if (W[i+1].equals("曇のち雨")) {
          result[16].play();
        } else if (W[i+1].equals("曇時々雨")) {
          result[17].play();
        } else if (W[i+1].equals("雨")) {
          result[18].play();
        } else if (W[i+1].equals("雨のち雪")) {
          result[19].play();
        } else if (W[i+1].equals("雨時々雪")) {
          result[20].play();
        } else if (W[i+1].equals("雪のち雨")) {
          result[21].play();
        } else if (W[i+1].equals("雪時々雨")) {
          result[22].play();
        } else if (W[i+1].equals("曇のち雪")) {
          result[23].play();
        } else if (W[i+1].equals("曇時々雪")) {
          result[24].play();
        } else if (W[i+1].equals("雪のち曇")) {
          result[25].play();
        } else if (W[i+1].equals("雪時々曇")) {
          result[26].play();
        } else if (W[i+1].equals("晴のち雪")) {
          result[27].play();
        } else if (W[i+1].equals("晴時々雪")) {
          result[28].play();
        } else if (W[i+1].equals("雪のち晴")) {
          result[29].play();
        } else if (W[i+1].equals("雪時々晴")) {
          result[30].play();
        } else if (W[i+1].equals("雪")) {
          result[31].play();
        }
        result[1].play();
        if (Htemp[i+1].length() == 2) {
          String x = Htemp[i+1].substring(0, 1);
          String y = Htemp[i+1].substring(1, 2);
          println(x);
          println(y);
          if (x.equals("2")) {
            num[0].play();
          } else if (x.equals("1")) {
            num[1].play();
          } else {
            num[13].play();
          }
          if (y.equals("1")) {
            num[4].play();
          } else if (y.equals("2")) {
            num[5].play();
          } else if (y.equals("3")) {
            num[6].play();
          } else if (y.equals("4")) {
            num[7].play();
          } else if (y.equals("5")) {
            num[8].play();
          } else if (y.equals("6")) {
            num[9].play();
          } else if (y.equals("7")) {
            num[10].play();
          } else if (y.equals("8")) {
            num[11].play();
          } else if (y.equals("9")) {
            num[12].play();
          }
        } else {
          String y = Htemp[i+1].substring(1, 1);
          if (y.equals("0")) {
            num[3].play();
          } else if (y.equals("1")) {
            num[4].play();
          } else if (y.equals("2")) {
            num[5].play();
          } else if (y.equals("3")) {
            num[6].play();
          } else if (y.equals("4")) {
            num[7].play();
          } else if (y.equals("5")) {
            num[8].play();
          } else if (y.equals("6")) {
            num[9].play();
          } else if (y.equals("7")) {
            num[10].play();
          } else if (y.equals("8")) {
            num[11].play();
          } else if (y.equals("9")) {
            num[12].play();
          }
        }
        result[3].play();
        result[1].play();
        if (Ltemp[i+1].length() == 2) {
          String x = Htemp[i+1].substring(0, 0);
          String y = Htemp[i+1].substring(1, 1);
          if (x.equals("2")) {
            num[0].play();
          } else {
            num[1].play();
          }
          if (y.equals("1")) {
            num[4].play();
          } else if (y.equals("2")) {
            num[5].play();
          } else if (y.equals("3")) {
            num[6].play();
          } else if (y.equals("4")) {
            num[7].play();
          } else if (y.equals("5")) {
            num[8].play();
          } else if (y.equals("6")) {
            num[9].play();
          } else if (y.equals("7")) {
            num[10].play();
          } else if (y.equals("8")) {
            num[11].play();
          } else if (y.equals("9")) {
            num[12].play();
          }
        } else {
          String y = Htemp[i+1].substring(1, 1);
          if (y.equals("0")) {
            num[3].play();
          } else if (y.equals("1")) {
            num[4].play();
          } else if (y.equals("2")) {
            num[5].play();
          } else if (y.equals("3")) {
            num[6].play();
          } else if (y.equals("4")) {
            num[7].play();
          } else if (y.equals("5")) {
            num[8].play();
          } else if (y.equals("6")) {
            num[9].play();
          } else if (y.equals("7")) {
            num[10].play();
          } else if (y.equals("8")) {
            num[11].play();
          } else if (y.equals("9")) {
            num[12].play();
          }
        }
        result[3].play();
        delay(5000);
        moving++;
      }
    }
  }
}
