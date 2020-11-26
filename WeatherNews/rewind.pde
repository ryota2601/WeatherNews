void rewind(){
  for (int i=0; i<14; i++)
  {
    chimei_read[i].rewind();
  }
  for (int i=0; i<14; i++)
  {
    num[i].rewind();
  }
  for (int i=0; i<32; i++)
  {
    result[i].rewind();
  }
}
