if [[ -z ${1} ]]; then
    echo "Please choose a game mode. Include a position parameter of 'add', 'subt', 'mult', or 'div'"
    exit
fi

function addition() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $(($RANDOM % 25)))
    rand2=$(echo $(($RANDOM % 25)))
    sum=$(echo $((${rand1} + ${rand2})))

    echo "What is" ${rand1} + ${rand2} "? " && read answer

    if [[ ${answer} == ${sum} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score : ${total}"
        git checkout talmage
        git add mathFun.sh
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in subtraction"
        git push
        exit
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    addition
}

function subtraction() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $((($RANDOM % 25) + 1)))
    rand2=$(echo $((($RANDOM % 25) + 1)))

    if [[ ${rand1} -lt ${rand2} ]]; then
        difference=$(echo $((${rand2} - ${rand1})))
        echo "What is" ${rand2} "-" ${rand1} "? " && read answer
    else
        difference=$(echo $((${rand1} - ${rand2})))
        echo "What is" ${rand1} "-" ${rand2} "? " && read answer
    fi


    if [[ ${answer} == ${difference} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score : ${total}"
        git checkout talmage
        git add mathFun.sh
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in subtraction"
        git push
        exit
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    subtraction
}

function mutliplication() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $(($RANDOM % 25)))
    rand2=$(echo $(($RANDOM % 25)))
    product=$(echo $((${rand1} * ${rand2})))

    echo "What is" ${rand1} "*" ${rand2} "? " && read answer

    if [[ ${answer} == ${product} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score : ${total}"
        git checkout talmage
        git add mathFun.sh
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in multiplication"
        git push
        exit
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    mutliplication
}

function division() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $((($RANDOM % 25) + 1)))
    rand2=$(echo $((($RANDOM % 25) + 1)))

    if [[ ${rand1} -lt ${rand2} ]]; then
        quotient=$(echo $((${rand2} / ${rand1})))
            echo "What is" ${rand2} "/" ${rand1} "? (no remainder)" && read answer
    else
        quotient=$(echo $((${rand1} / ${rand2})))
            echo "What is" ${rand1} "/" ${rand2} "? (no remainder)" && read answer
    fi

    if [[ ${answer} == ${quotient} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score : ${total}"
        git checkout talmage
        git add mathFun.sh
        git log -1
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in division"
        git push
        exit
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    division
}

case ${1} in

add)
    addition
    ;;

subt)
    subtraction
    ;;

mult)
    mutliplication
    ;;

div)
    division
    ;;
esac

