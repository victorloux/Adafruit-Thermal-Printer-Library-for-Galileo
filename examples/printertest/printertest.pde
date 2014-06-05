/*************************************************************************
  This is an Arduino library for the Adafruit Thermal Printer.
  Pick one up at --> http://www.adafruit.com/products/597
  These printers use TTL serial to communicate, 2 pins are required.

  Adafruit invests time and resources providing this open source code.
  Please support Adafruit and open-source hardware by purchasing products
  from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.
  MIT license, all text above must be included in any redistribution.
 *************************************************************************/

#include "Adafruit_Thermal_Galileo.h"
#include "adalogo.h"
#include "adaqrcode.h"

// RX (pin 0) = green wire
// TX (pin 1) = yellow wire

Adafruit_Thermal_Galileo printer;

void setup(){
  printer.begin();

  // The following function calls are in setup(), but do not need to be.
  // Use them anywhere!  They're just here so they're run only one time
  // and not printed over and over.
  // Some functions will feed a line when called to 'solidify' setting.
  // This is normal.

  // Test inverse on & off
  printer.inverseOn();
  printer.println("Inverse ON");
  printer.inverseOff();

  // Test character double-height on & off
  printer.doubleHeightOn();
  printer.println("Double Height ON");
  printer.doubleHeightOff();

  // Set text justification (right, center, left) -- accepts 'L', 'C', 'R'
  printer.justify('R');
  printer.println("Right justified");
  printer.justify('C');
  printer.println("Center justified");
  printer.justify('L');
  printer.println("Left justified");

  // Test more styles
  printer.boldOn();
  printer.println("Bold text");
  printer.boldOff();

  printer.underlineOn(); 
  printer.println("Underlined text ");
  printer.underlineOff();

  printer.setSize('L');     // Set type size, accepts 'S', 'M', 'L'
  printer.println("Large"); // Print line
  printer.setSize('M');
  printer.println("Medium");
  printer.setSize('S');
  printer.println("Small");

  printer.justify('C');
  printer.println("normal\nline\nspacing");
  printer.setLineHeight(50);
  printer.println("Taller\nline\nspacing");
  printer.setLineHeight(); // Reset to default
  printer.justify('L');

  // Barcode examples
  printer.feed(1);
  // CODE39 is the most common alphanumeric barcode
  printer.printBarcode("ADAFRUT", CODE39);
  printer.setBarcodeHeight(100);
  // Print UPC line on product barcodes
  printer.printBarcode("123456789123", UPC_A);

  // Print the 75x75 pixel logo in adalogo.h
  printer.printBitmap(adalogo_width, adalogo_height, adalogo_data);

  // Print the 135x135 pixel QR code in adaqrcode.h
  printer.printBitmap(adaqrcode_width, adaqrcode_height, adaqrcode_data);
  printer.println("Adafruit!");
  printer.feed(1);

  printer.sleep();      // Tell printer to sleep
  printer.wake();       // MUST call wake() before printing again, even if reset
  printer.setDefault(); // Restore printer to defaults
}

void loop() {
}
