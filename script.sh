#!/bin/bash
function rep_list_show() {

	echo "вывожу список настроеных репозиториев"

	sudo grep -rhE ^deb /etc/apt/sources.list* | cat -n 

	echo "Вывожу подробную информацию о подключенных репозиториях"
        apt-cache policy

}

function rep_name() {
	echo "Введите имя репозитория"
	read name

}

function all_repo_show() {
	echo "Вывожу все репозитории"
	nl /etc/apt/sources.list
}

function off_repo () {
	echo "Введите номер строчки, репозиторий которой хотите отключить"
	read number
	re='^[0-9]+$'
	if [ $number != $re ]
	then
		if [ "$number" == 1 ]
		then 
		sed -i '1s/^/# /' ./etc/apt/sources.list
		elif [ "$number" = 2 ]
		then
		sed -i '2s/^/# /' ./etc/apt/sources.list
		elif [ "$number" = 3 ]
		then
		sed -i '3s/^/# /' ./etc/apt/sources.list
		elif [ "$number" = 4 ]
		then
		sed -i '4s/^/# /' ./etc/apt/sources.list
		elif [ "$number" = 5 ]
		then
		sed -i '5s/^/# /' ./etc/apt/sources.list
		elif [ "$number" = 6 ]
		then
		sed -i '6s/^/# /' ./etc/apt/sources.list
		echo "Репозиторий успешно отключен!"
		fi
	else
	echo "Вы ввели не целое число, попробуйте позже!"
	fi

}

function on_repo () {
	echo "Введите номер строки, репозиторий которой хотите включить"
	read number
	re='^[0-9]+$'
        if [ $number != $re ]
        then
		if [ "$number" == 1 ]
	        then 
	        sed -i '1s/^# //' ./etc/apt/sources.list
	        elif [ "$number" = 2 ]
	        then
	        sed -i '2s/^# //' ./etc/apt/sources.list
	        elif [ "$number" = 3 ]
	        then
	        sed -i '3s/^# //' ./etc/apt/sources.list
	        elif [ "$number" = 4 ]
	        then
	        sed -i '4s/^# //' ./etc/apt/sources.list
	        elif [ "$number" = 5 ]
	        then
	        sed -i '5s/^# //' ./etc/apt/sources.list
	        elif [ "$number" = 6 ]
	        then
	        sed -i '6s/^# //' ./etc/apt/sources.list
		echo "Реопзиторий успешно включен!"
		fi
	else
	echo "Вы ввели не целое число, попробуйте позже!"
	fi

}

function new_rep () {
	apt-get install nano

	nano /etc/apt/sources.list.d/test.list
	
	echo "Добавляю ключи для репозитория"
	echo "..."
	# curl -LsSO https://mariadb.org/mariadb_release_signing_key.asc
	# chmod -c 644 mariadb_release_signing_key.asc
	# mv -vi mariadb_release_signing_key.asc /etc/apt/trusted.gpg.d/
	echo "Ключи успешно добавлены!"
	echo "Просмотреть новые репозитории?   [Y/n]"
	read var
	if [ "$var" = y ]
	then nl /etc/apt/sources.list.d/test.list
	else
	echo "Вывожу в главное меню"
	fi
}


while [ true ]; do 
    echo " "
    echo "Хотите получить список установленных и настроенных  репозиториев? 1 "
    echo "Список ВСЕХ репозиториев - 2"
    echo "Отключить конкретный репозиторий - 3"
    echo "Включить конкретный репозиторий - 4"
    echo "Хотите добавить новый репозиторий - 5"

    echo "Выход - 6"
    read choice
    case $choice in
        1) rep_list_show;;
        2) all_repo_show;;
	3) off_repo;;
	4) on_repo;;
	5) new_rep;;
	6) exit;;
	*) echo "Try again";;
esac
done
	*) echo "Команда не поддерживается"
esac
done
