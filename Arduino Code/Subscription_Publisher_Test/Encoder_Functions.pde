void Encoder::count()
{
  if(digitalRead(_ch2Pin) == HIGH)
  {
    _odometer++;
  }
  else{
    _odometer--;
  }
}

int Encoder::totaldistance()
{
  return _odometer;
}

int Encoder::deltadistance()
{
  _delta = _odometer-_oldodom;
  _odometer = _oldodom;
  return _delta;
}
