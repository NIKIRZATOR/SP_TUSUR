
echo "Программа для работы с репозиториями"
echo "Список репозиториев, информация о них, создание нового"
echo "Разработчик Буравский Н. С. 718-1"

function rep_info () {
    apk info
    value=$(apk info | wc -l)
    echo "Общее число пакетов: $value" 
    echo " "

    echo "Введите название репозитория, например: nano"
    users_rep

}

function rep_search () {
    apk search -v
    value1=$(apk search -v | wc -l)
    echo "Общее число доступных для скачивания репозиториев: $value1"
    echo " "
    
} 

function rep_user_info () {
    echo "Введите название репозитория"
    read rep_title

    var1=$(apk info $rep_title)
    if [ -z "$var1" ]
    then 
    echo "К сожалению, данный репозиторий не был найден "
    else
    echo "Политки репозитория"
    apk policy $rep_title
    echo " "

    echo "Информация об установленном репозитории"
    apk info $rep_title
    echo " "

    echo "Верcия репозитория"
    $rep_title --version
    echo " "
    fi

}

function rep_install () {
    echo "Введите название репозитория"
    read rep_to_install

    var1=$(apk search $rep_to_install)
    if [ -z "$var1" ]
    then 
    echo "К сожалению, данный репозиторий не был найден "
    else
    apk add $rep_to_install
    echo "Установлено!"
    fi

}

function users_rep () {
    read name

    NIK=$(apk manifest $name) 
    if [ -z "$NIK" ]
    then 
    repo_add $name
    else
    repo_info $name
    fi
}

function repo_info () {
    echo "Вывожу всю информацию по репозиторию"
    echo " "

    echo "Политки репозитория"
    apk policy $name
    echo " "

    echo "Информация об установленном репозитории"
    apk info $name
    echo " "

    echo "Верия репозитория"
    $name --version

}

function repo_add () {
    echo "К сожалению, данный репозиторий отсутствует"
    echo "Установить данный репозиторий? 1 - Да, 2 - Нет"
    read add_choice
    case $add_choice in
        1) apk add $name;;
        2) echo "Ну хорошо, не хотите, не надо.";;
        *) echo "Не поддерживается данная команда" ;;
    
    esac

}

while [ true ]; do 
    echo " "
    echo "Хотите получить список установленных репозиториев? 1 "
    echo "Хотите получить информацию по установленному репозиторию? - 2"
    echo "Хотите установить конткретный репозиторий? - 3"
    echo "Хотете просмотреть список доступных репозиториев для установки? - 4"
    echo "Выход - 5"
    read choice
    case $choice in
        1) rep_info;;
        2) rep_user_info;;
        3) rep_install;;
        4) rep_search;;
        5) exit;;
        *) echo "Не поддерживается данная команда" ;;
    
    esac
done