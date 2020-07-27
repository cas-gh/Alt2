This Bash script was created to fill the role of a program that I had used on
Windows. I was unable to find a suitable solution that was being actively
maintained that allowed for specific window event monitoring.



What this script does is look at a specified window for events. Currently what
an event can be is a mouse click. When the specified window is the currently 
active window, and there is a detected mouse click, a timer is reset. If that
timer is allowed to reach 0 before an input is detected in that specified 
window, an alert is fired. Currently this is literally a `spd-say` computer
voice saying "Click". After which the timer is reset to a short time, the 
default value being 10 seconds, where it will repeat the alert when it again
reaches 0. This continues until a mouse click is detected in the specified
window.



Before this script will run, you will need to obtain the `xdotool` command-line
X11 automation tool.

To get started with this script, there are only a few modifications that need
to be made so that it will work on your machine. Firstly, the $WINDOW_ID 
variable. This is currently hard-coded into the script and must be changed
each time you want either change the window that is being watched, or the
ID for the window you want has changed due to a reboot. I suggest you open up
a terminal window and run `xdotool selectwindow` and click the window you'd 
like to watch. Copy the output of that command and set the WINDOW_ID variable
to that number. Ensure there are no spaces after the `=` when doing so.

Later versions will automate this process.

Another change you will likely want to make is the time it takes the script to
alert you after it has detected an input on the specified window. This can be
done currently by changing the integer in the $CHECK variable near the top to
whatever number of seconds you'd like the alert to fire after. You must also 
change the integer value in the `if` statement below the $ACTIVE_WINDOW 
variable. That is the value to which the timer is reset after a detected
input.

Later versions will also automate this process.

For some, the MOUSE_ID variable will not accurately reflect your mouse inputs
and will need changing for the script to recoginze the inputs properly, but 
most should not have an issue with this out of the box.

