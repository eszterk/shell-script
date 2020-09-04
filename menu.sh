#!/usr/bin/env bash

clear
 
#<---------------------------------------------FUNCTION RUNS IF FRUITS.CSV IS ENTERED------------------------------------------------------------------->
function fruit_function {
  if [ $1 = "awk" ];
      then
      	message="$(awk -F ','  '{print $2}' fruits.csv)"
    elif [ $1 = "grep" ];
      then
        message="$(grep 'e' fruits.csv)"
      else
	echo $1
        message="ERROR, INVALID CHOICE"
  fi
  	  whiptail --msgbox "$message" 20 50
} 

#<-------------------------------------------FUNCTION RUNS IF THE INPUT IS NOT FRUITS.CSV---------------------------------------------------------------->
function veg_function {
  if [ $1 = "awk" ];
      then
        message="$(awk -F ',' '{print $2}' vegetables.csv )"
    elif [ $1 = "grep" ];
      then
        message="$(grep 'e' vegetables.csv )"
      else
	echo $1
        message="ERROR, INVALID CHOICE"
  fi
    	whiptail --msgbox "$message" 20 50
}

#<--------------------------------INPUT BOX | IF THE INPUT IS FRUITS.CSV THE FRUIT_FUNCTION RUNS OTHERWISE VEG_FUNCTION------------------------------------>
function awk_function {
  choice_awk=$(whiptail --inputbox "Enter the filename you wish to awk: fruits.csv or vegetables.csv" 10 60 "" --nocancel --title "Awk filename" 3>&1 1>&2 2>&3);
    if [ "$choice_awk" == "fruits.csv" ];
      then
        fruit_function "awk" 
      else
        veg_function "awk"
    fi
}

#<-------------------------------INPUT BOX | IF THE INPUT IS FRUITS.CSV THE FRUIT_FUNCTION RUNS OTHERWISE VEG_FUNCTION------------------------------------->
function grep_function {
  choice_grep=$(whiptail --inputbox "Enter the filename you wish to grep: fruits.csv or vegetables.csv" 10 60 "" --nocancel --title "Grep filename" 3>&1 1>&2 2>&3);
     if [ "$choice_grep" == "fruits.csv" ];
      then
        fruit_function "grep"
      else
        veg_function "grep"
    fi
}

#<----------------------------------------------------EXIT COMMAND----------------------------------------------------------------------------------------->
function exit_program {
	clear
	exit
}

#<-----------------------------YES/NO DIALOGBOX | IF GREP IS CHOSEN GREP_FUNCTION WILL RUN, OTHERWISE AWK_FUNCTION----------------------------------------->
function grep_or_awk {
    if (whiptail --title "Would you like to use grep or awk?" --yesno " " --yes-button "Grep" --no-button "Awk" 8 70);
      then
        grep_function
      else
        awk_function
    fi

}

#<-------------------------------------------------YES/NO DIALOGBOX | GREP OR AWK-------------------------------------------------------------------------->
function main {
    if (whiptail --title "Would you like to proceed or exit the program?" --yesno "" --yes-button "Proceed" --no-button "Exit" 8 70);
      then
        grep_or_awk
      else
        exit_program
    fi
}

#<------------------------------------------------------WHILE LOOP----------------------------------------------------------------------------------------->
while true
  do
    main
  done
exit


