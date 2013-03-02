gCountDown
==========

About
-----

gCountDown is a very simple alarm countdown timer. It sits in your system tray
where you can click it to set an alarm. Once the time runs out, you will be
alerted.

Requirements & installation
---------------------------

Requires:

*   Python 2.5+
*   pygtk
*   pynotify

Installation:

*   TODO

Usage
-----

To start from the menu:

	Menu -> Accessories -> gCountDown

To start from the commandline:

	$ cd gcountdown
	$ ./gcountdown

An alarm clock icon will appear in your system tray.

To SET an alarm:

	Click the clock icon, enter the details of your alarm and click 'Apply'.
	The clock icon will now change show a green arrow in the bottom-right
	corner to indicate an alarm is running.  The alarm will off after the time
	specified. The clock will then change to a bell to indicate the alarm has
	gone off. A desktop notification will also be shown.

To CANCEL an alarm:
	
	Click the clock icon, click 'Cancel'

To RESET an alarm after it has gone off:

	Click the bell icon in your system tray.


Copyright & License
-------------------

gCountDown is (C) Copyright 2011, Ferry Boender

gCountDown is licensed under the MIT License. See the LICENSE.txt file
for more information.

gCountDown uses icons from the Silk Icon set, available here:

	http://www.famfamfam.com/lab/icons/silk/

	The Silk Icon set is licensed under:

	Creative Commons Attribution 3.0 License 

gCountDown includes part of Pyglet, a cross-platform windowing and multimedia
library for Python, available here:

	http://pyglet.org/
