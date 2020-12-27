#!/bin/sh


findUser() {
	echo "Lets go to find something"
	echo "Which word do you want to find on the address?"
	read varName
	grep "$varName" direction.txt
	echo "Press intro to go to menu"
	read varOption
	clear


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
	


	echo "All your information is correct (yes or no)?"
	echo "$varName $varSurname $varMail $varPhone $varDirection $varCity $varCountry"
	read option

	if [ $option = "yes" ] ; then
		echo "$varName:$varSurname:$varMail:$varPhone:$varDirection:$varCity:$varCountry" >> direction.txt
		echo "User Added!"
		echo "press intro"
		read varOption 
	elif [ $option = "no" ] ; then
		echo "Start again"
		read varOption
		addUser
	else
		echo "Start again"
		read varOption
		addUser
	fi



	
}

deleteUser() {
	echo "Which user do you want to Delete"
	read varName
	while read book
	do	
		search=`head -$? $BOOK | tail -1|tr ' ' '.'`
		
	done < direction.txt
}

editUser() {
	echo "option4"
}

listUser(){
	echo "I will show you all your directions!"
	while read f
	do
		echo "$f"
	done < direction.txt
	echo "*************That's All!***************"
	read varOption


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
			deleteUser
			;;
		4)
			listUser
			;;
		5)
			echo "Bye!!!"
			exit
			;;
		*)
			echo "Lo siento, no te he entendido"
			;;
	esac
done



