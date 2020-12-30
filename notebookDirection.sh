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
	echo "Are you sure to edit this user (yes or no)?"
	read input
	case $input in
		yes)
			arrayText=`grep "$varName" direction.txt`			
			

			echo "Which is the Name [ `echo $arrayText | awk -F: '{print $1}'` ]?"
			read varName
			if [ -z "$varName" ]; then
				varName=`echo $arrayText | awk -F: '{print $1}'`
			fi
			echo "Which is the Surname [ `echo $arrayText | awk -F: '{print $2}'` ]?"
			read varSurname
			if [ -z "$varSurname" ]; then
				varSurname=`echo $arrayText | awk -F: '{print $2}'`
			fi
			echo "Which is the mail [ `echo $arrayText | awk -F: '{print $3}'` ]?"
			read varMail
			if [ -z "$varMail" ]; then
				varMail=`echo $arrayText | awk -F: '{print $3}'`
			fi
			echo "Which is the Phone [ `echo $arrayText | awk -F: '{print $4}'` ]?"
			read varPhone
			if [ -z "$varPhone" ]; then
				varPhone=`echo $arrayText | awk -F: '{print $4}'`
			fi
			echo "Which is the Direction [ `echo $arrayText | awk -F: '{print $5}'` ]?"
			read varDirection
			if [ -z "$varDirection" ]; then
				varDirection=`echo $arrayText | awk -F: '{print $5}'`
			fi
			echo "Which is the City [ `echo $arrayText | awk -F: '{print $6}'` ]?"
			read varCity
			if [ -z "$varCity" ]; then
				varCity=`echo $arrayText | awk -F: '{print $6}'`
			fi
			echo "Which is the Country [ `echo $arrayText | awk -F: '{print $7}'` ]?"
			read varCountry
			if [ -z "$varCountry" ]; then
				varCountry=`echo $arrayText | awk -F: '{print $7}'`
			fi

			sed "/$arrayText/d" direction.txt > direction.tmp
			echo "$varName:$varSurname:$varMail:$varPhone:$varDirection:$varCity:$varCountry" >> direction.tmp
			mv direction.tmp direction.txt
			echo "User $varName edited!"

			;;
			
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



