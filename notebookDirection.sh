#!/bin/sh


findUser() {
	echo "Lets go to find something"
	echo "Which word do you want to find on the address?"
	read varName
	grep "$varName" direction.txt
	echo "Press intro to go to menu"
	read varOption


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
	else
		echo "Start again"
		read varOption
		addUser
	fi



	
}

deleteUser() {
	echo "Which user do you want to Delete? You can put name or surname or email"
	read varName
	grep "$varName" direction.txt
	echo "Are you sure to erase all this contacts?"
	read input
	case $input in
		yes)
			sed "/$varName/d" direction.txt > direction.tmp
			mv direction.tmp direction.txt
			echo "Users $varName deleted!"
			;;
		no)
			deleteUser
			;;
		*)
			;;
	esac

	
}

editUser() {
	echo "Which user do you want to edit?"
	read varName
	grep "$varName" direction.txt
	echo "Are you sure to edit this user?"
	read input
	case $input in
		yes)

			;;
			#https://www.javatpoint.com/bash-split-string#:~:text=In%20bash%2C%20a%20string%20can,the%20string%20in%20split%20form.
			#asignacio a variables auxiliars per defecte,
			#omplir correctament les dades
			#borrar antic usuari
			#inserir nou usuari 
		no)
			deleteUser
			;;
		*)
			;;
	esac

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
			clear
			;;
		2)
			addUser
			clear
			;;
		3)
			echo "Do you want to delete user or edit it? (delete or edit)"
			read option
			case $option in
				edit)
					editUser
					;;
				delete)
					deleteUser
					;;
				*)
					;;
			esac
			;;
		4)
			listUser
			clear
			;;
		5)
			echo "Bye!!!"
			exit
			;;
		*)
			echo "Choose a correct option"
			;;
	esac
done



