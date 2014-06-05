This is a fork of [Adafruit's Thermal Printer library](https://github.com/adafruit/Adafruit-Thermal-Printer-Library) **modified to make it compatible with the Intel® Galileo** x86 boards, who do not support some AVR libraries (SoftwareSerial and PROGMEM).

## Changes ##

* Library renamed to `Adafruit_Thermal_Galileo` to avoid conflicts with the original library (so you can still use the original library for AVR boards)
* Replaced `SoftwareSerial` with `Serial1`. The GPIO pins on the Galileo are too slow (230 kHz) to allow a software serial, so the library now uses `Serial1` which is basically the hardware `Serial` you normally use, except it works on pins 1 and 0 instead of the USB serial, like on Arduino Megas/Due. **This means you need to connect the thermal printer on pins 0 (RX, green wire) and 1 (TX, yellow wire) and not on other GPIO pins.**
* The Galileo does not support `[PROGMEM](http://arduino.cc/en/Reference/PROGMEM)`, that is used for storing bitmap images. Given the Galileo's storage and RAM are much larger than stock Arduinos, they have been changed to standard `static const unsigned char` and references to Progmem have been deleted from the library.
* The Processing sketch to convert images now works on Processing 2+

## Usage ##

* Clone the library in your Arduino library folder
  * Mac: (home)/Documents/Arduino/Libraries
  * PC: My Documents\Arduino\libraries
  * Linux: (home directory)/sketchbook/libraries
* Restart the Arduino IDE if it was open
* Connect the printer to your Galileo, with the green wire on pin 0, yellow wire on pin 1 and black on GND.
* Go to Sketch > Import Library > thermalPrinterGalileo
* Use this line to create the printer object:
```arduino
Adafruit_Thermal_Galileo printer;
```
(**note there are no more parentheses or arguments after `printer`** as you do not need to set the RX/TX pins)
* All the other methods work like the original library (see documentation [there](https://learn.adafruit.com/mini-thermal-receipt-printer)).

Alternatively to test the printer **open File > Examples > thermalPrinterGalileo > printertest**. The example and images were updated.

## Credits ##

Written by Limor Fried/Ladyada for Adafruit Industries, based on Thermal
library from bildr.org 
MIT license, all text above must be included in any redistribution.

Galileo modifications by Victor L.