# new attempt at alt1 clone

WINDOW_ID=60817428
MOUSE_ID=$(xinput --list | grep -i -m 1 'mouse' | grep -o 'id=[0-9]\+' | grep -o '[0-9]\+')

STATE1=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
CHECK_STATE=$STATE1

# Change number after '$NOW +' to number of seconds until alert here and
# in the window check if statement
NOW=$(date +"%s")
CHECK=$(($NOW + 80))
while true
do
   
   
    sleep 0.05
    STATE2=$(xinput --query-state $MOUSE_ID | grep 'button\[' | sort)
    
    # Prints out the button states
    # comm -13 <(echo "$STATE1") <(echo "$STATE2")
        
    ACTIVE_WINDOW=$(xdotool getactivewindow)

    # Checks if mouse button has been clicked while the specified window is
    # the focused window
    if [[ "$CHECK_STATE" != "$STATE2" && "$ACTIVE_WINDOW" == "$WINDOW_ID" ]]
    then
	    CHECK=$(($NOW + 80))

    fi
    

    STATE1=$STATE2
    NOW=$(date +"%s")

#   Debug pring statements
#    echo $NOW
#    echo $CHECK
    
    COUNTDOWN=$(($CHECK - $NOW))
    echo $COUNTDOWN


#   If the specified amount of time has passed, alert the user and reset
#   the time to next alert to 5 seconds
    if [ "$CHECK" == "$NOW" ]
    then
	    spd-say click
	    echo "click"
	    CHECK=$(($NOW + 5))
    fi

done

