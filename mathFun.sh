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
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in addition"
        git push
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
        git add .
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in subtraction"
        git push
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
        git checkout main
        git pull
        git checkout talmage
        git merge
        git add .
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in multiplication"
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    mutliplication
}

function division() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$((($RANDOM % 25) + 1))
    rand2=$((($RANDOM % 25) + 1))

    if [[ ${rand1} -lt ${rand2} ]]; then
        quotient=$(echo $((${rand2} / ${rand1})))
            echo "What is" ${rand2} "/" ${rand1} "? " && read answer
    else
        quotient=$(echo $((${rand1} / ${rand2})))
            echo "What is" ${rand1} "/" ${rand2} "? " && read answer
    fi

    echo "What is" ${rand1} "/" ${rand2} "? " && read answer

    if [[ ${answer} == ${quotient} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score : ${total}"
        git checkout main
        git pull
        git checkout talmage
        git merge
        git add .
        git commit -m "`echo $(whoami)` got score ${total} on `echo $(date)` in division"
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    division
}

if [[ -z ${1} ]]; then
    "Please choose a game mode. Include a position parameter of 'add', 'subt', 'mult', or 'div'"
fi

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
