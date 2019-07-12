# UVa Bucket List for iPhone 8 Plus

Jeremy Weng and Alicia Zheng

# Basic Tips On How to Use the App

The app is relatively simple to use; at the bucket list screen, you can press the plus button on the top right to launch the add item screen. On this screen, there are four fields and a date spinner. Of the four fields, the latitude and longitude accept only decimal values; a numpad keyboard should pop up if using the simulator with the computer keyboard disconnected from the application. It also does not accept non-numeric values. Tapping away from any of the editable text fields will dismiss the keyboard. Pressing cancel returns to the bucket list screen without doing anything, and save will save the item. The fields are all optional. 

Back on the bucket list screen, swiping an item from right to left well bring out two buttons: edit and done. Done will mark the item as done and gray it out while bringing it to the bottom of the list, and edit will launch the edit screen. This screen is identical to the add item screen, except it is prepopulated with data. 

# Lessons Learned
As always, the biggest thing we learned was the technical aspect. We ran into lots of issues, far more than we ever did with Android Studio. Since neither of us were familiar with Swift, learning a new syntax coupled with the new IDE was definitely challenging. Even something as simple as restraining a text box to numeric values only was much more complicated and took an incredibly long time. However, the UI was much easier to control because of the storyboard, which was very convenient as Android Studio layouts are particularly hard to get just right. 

We also learned how impressive it is to have apps on both the app store and play store, because of how different the coding is for these platforms; as users, we take for granted the difficulty of having apps on both Apple and Android devices. In our case, we thought the apps would need only minor changes to be compatible with both platforms, but even programming a simple bucket list app resulted in huge differences in functionality, appearance, and code.

Lastly, we learned about our preference for Android Studio. Apple is very restrictive and isolated from its competitors - it became painfully clear to us since neither of us own Macs, as it was incredibly difficult and inconvenient to code in. Also, never ever attempt to run an iPhone simulator within a MacOS emulator in VirtualBox. Four frames per second combined with dragging and dropping will likely result in far more computer smashing than is normal in programming. 

Overall, we were surprised by how much we took away from programming this mini-app. We assumed that because we were programming virtually the same app, there wouldn’t be much else to learn and it would be much easier, as we knew what we were doing. If anything, this app was significantly more difficult to code.

# Milestone Progress

For the milestone, we were able to implement a prepopulated bucket list that supports swiping an item from right to left to reveal some buttons that don't do anything yet. The + button switches the screen to the add item view controller that is embedded in a navigation controller, and has a cancel and save button. The cancel button dismisses the screen and goes back to the bucket list. The save button can successfully add a new item to the preexisting list, with the list currently sorting only by date. Latitude/longitude haven't been set to only accept numeric values, and the constraints need to be changed so that screen size doesn't cause the fields to look weird. We would also like to add a requirement to the title field so that the user must write something to be able to save a new item.
