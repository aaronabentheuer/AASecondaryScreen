#AASecondaryScreen
An approachable implementation of AirPlay-Mirroring using Swift in iOS.

##Introduction
This is a small part of a much bigger project I (together with [Sarah Mautsch](https://github.com/sarahmautsch) and [Christoph Labacher](https://github.com/christophlabacher), supported by our lecturer [Roger Walk](http://www.uni-ulm.de/?id=5425)) built in the course "Interactive Communications Systems" at [Hochschule für Gestaltung Schwäbisch Gmünd](http://www.hfg-gmuend.de). We wanted to make an interactive exhibit for a museum that visitors could also take home with them after the visit and decided to go with an iOS App + AirPlay Mirroring, which can be used both as a big-screen projection in the museum as well as on the TV at home. The full project will be published here shortly. Stay tuned!

##Description
Here I extracted and simplified the process of implementing a secondary screen in iOS (which can be used both wired or wireless via AirPlay) so it would bse comprehensible for beginners, as I struggled a lot when implementing this for the first time. Besides a very clean setup-process it also includes some hooks to react to user-behavior and therefore potentially assist the user in setting up AirPlay, as we found this to be a very cumbersome process for a lot of users when testing this for our project. I tried to add as much commentary as I thought would be necessary to get you started, but feel free to contact me if you encounter any problems.

##Testing
Luckily you neither need an iOS-Device nor an Apple-TV to try this out, as the iOS Simulator can simulate external displays in a variety of resolutions. In the “iOS Simulator” application on your Mac, you can activate those in *“Hardware”* → *“External Displays”* and choose the resolution you want to test with.
Please keep in mind that the set-up process won't be as smooth for your users as it is highly reliant on a good network connection and the user’s knowledge about how to set-up AirPlay in the first place. Therefore it is very important to do testing on an actual device with an Apple TV to get the experience right.

When testing on an Apple TV it is very important to deactivate **“Adjust for AirPlay Overscan”** on your Apple TV as this will result in a distorted picture. You can deactivate this option on your Apple TV in *“Settings”* → *“Audio & Video”* → *“Adjust for AirPlay Overscan”*. When everything is set-up correctly and your iOS-Device is connected to the Apple TV with the application opened, you should see a pulsating turquoise border of consistent width alongside the display's bounds.

##License
Released under the **MIT License**.
Copyright © 2015 [Aaron Abentheuer](http://www.aaronabentheuer.com).

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
