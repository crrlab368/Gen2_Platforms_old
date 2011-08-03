Motor::Motor(int right_enable, int right_I1, int right_I2, int left_enable, int left_I1, int left_I2)
{
  pinMode(right_enable, OUTPUT);
  pinMode(right_I1, OUTPUT);
  pinMode(right_I2, OUTPUT);
  _rightEnablePin = right_enable;
  _rightI1pin = right_I1;
  _rightI2pin = right_I2;
  _rightPercent = 0;
  _rightpwm = 0;
  analogWrite(right_enable, 0);
  pinMode(left_enable, OUTPUT);
  pinMode(left_I1, OUTPUT);
  pinMode(left_I2, OUTPUT);
  _leftEnablePin = left_enable;
  _leftI1pin = left_I1;
  _leftI2pin = left_I2;
  _leftPercent = 0;
  _leftpwm = 0;
  analogWrite(left_enable, 0);
  mstop();
}

void Motor::forward()
{
  digitalWrite(_rightI1pin, HIGH);
  digitalWrite(_rightI2pin, LOW);
  digitalWrite(_leftI1pin, HIGH);
  digitalWrite(_leftI2pin, LOW);
}
void Motor::right_forward()
{
  digitalWrite(_rightI1pin, HIGH);
  digitalWrite(_rightI2pin, LOW);
}
void Motor::left_forward()
{
  digitalWrite(_leftI1pin, HIGH);
  digitalWrite(_leftI2pin, LOW);
}

void Motor::backward()
{
  digitalWrite(_rightI1pin, LOW);
  digitalWrite(_rightI2pin, HIGH);
  digitalWrite(_leftI1pin, LOW);
  digitalWrite(_leftI2pin, HIGH);
}
void Motor::right_backward()
{
  digitalWrite(_rightI1pin, LOW);
  digitalWrite(_rightI2pin, HIGH);
}
void Motor::left_backward()
{
  digitalWrite(_leftI1pin, LOW);
  digitalWrite(_leftI2pin, HIGH);
}

void Motor::mspeed(int percent)
{
  _rightPercent = percent;
  _rightpwm = (_rightPercent*255)/100;
  _leftPercent = percent;
  _leftpwm = (_leftPercent*255)/100;
  analogWrite(_rightEnablePin, _rightpwm);
  analogWrite(_leftEnablePin, _leftpwm);
}
void Motor::right_mspeed(int value)
{
 // _rightPercent = percent;
 // _rightpwm = (_rightPercent*255)/100;
  _rightpwm = value;
  analogWrite(_rightEnablePin,_rightpwm);
}
void Motor::left_mspeed(int value)
{
 // _leftPercent = percent;
 // _leftpwm = (_leftPercent*255)/100;
    _leftpwm = value;
  analogWrite(_leftEnablePin, _leftpwm);
}

void Motor::mstop()
{
  digitalWrite(_rightI1pin, HIGH);
  digitalWrite(_rightI2pin, HIGH);
  digitalWrite(_leftI1pin, HIGH);
  digitalWrite(_leftI2pin, HIGH);

}

void Motor::right_mstop()
{
  digitalWrite(_rightI1pin, HIGH);
  digitalWrite(_rightI2pin, HIGH);
}

void Motor::left_mstop()
{
  digitalWrite(_leftI1pin, HIGH);
  digitalWrite(_leftI2pin, HIGH);

}

Encoder::Encoder(int ch1Pin, int ch2Pin)
{
  pinMode(ch1Pin, INPUT);
  pinMode(ch2Pin, INPUT);
  _ch1Pin = ch1Pin;
  _ch2Pin = ch2Pin;
  _odometer = 0;
  _delta = 0;
  _oldodom = 0;
}
