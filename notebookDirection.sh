#!/bin/sh


findUser() {
	echo "option1"
}

addUser() {
	clear
	echo "You have choose ADDUser"
	echo "Which is your Name?"
	read varName
	echo "Which is your Surname?"
	read varSurname
	echo "Which is your Mail?"
	read varMail
	echo "Which is your phone?"
	read varPhone
	echo "Which is your direction?"
	read varDirection
	echo "Which is your City?"
	read varCity
	echo "Which is your Country?"
	read varCountry
	


	while [ "$option" != "no" ] && [ "$option" != "yes" ]
	do
		echo "All your information is correct (yes or no)?"
		echo "$varName $varSurname $varMail $varPhone $varDirection $varCity $varCountry"
		read option

		if [ $option = "yes" ] ; then
			echo "$varName:$varSurname:$varMail:$varPhone:$varDirection:$varCity:$varCountry" >> direction.txt
		elif [ $option = "no" ] ; then
	    	echo "Lo has escrito mal vuelve a empezar"
			addUser
		else
			echo "WTF are u writting"
		fi

	done


	
}

deleteUser() {
	echo "option3"
}

editUser() {
	echo "option4"
}

listUser(){
	echo "I will show you all your directions!"

}

while :
do
	echo "++++++++++++++++++++++++++++++"
	echo "Welcome to DevOps Notebook"
	echo " What do you want to do? "
	echo "1 - Find User"
	echo "2 - Add User"
	echo "3 - Edit/Delete User"
	echo "4 - List Users"
	echo "5 - Bye"
	echo "Write numbers from 1 to 5"
	read INPUT_STRING
	case $INPUT_STRING in
		1)
			findUser
			;;
		2)
			addUser
			;;
		3)
			echo "OPTION3"
			;;
		4)
			echo "Option4"
			;;
		5)
			echo "Bye!!!"
			;;
		*)
			echo "Lo siento, no te he entendido"
			;;
	esac
done



