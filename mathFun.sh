# set -x
rand1=$(echo $(($RANDOM % 25)))
rand2=$(echo $(($RANDOM % 25)))
sum=$(echo $((${rand1} + ${rand2})))

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
        echo "Final Score For Addition: ${total}"
        git status
        git add mathFun.sh
        git status
        git commit -m "${total}"
        git status
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    addition
}

function subtraction() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $(($RANDOM % 25)))
    rand2=$(echo $(($RANDOM % 25)))
    if [[ ${rand1} -lt ${rand2} ]]; then
        sum=$(echo $((${rand2} - ${rand1})))
        echo "What is" ${rand2} - ${rand1} "? " && read answer
    else
        sum=$(echo $((${rand1} - ${rand2})))
        echo "What is" ${rand1} - ${rand2} "? " && read answer
    fi


    if [[ ${answer} == ${sum} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score For Subtraction: ${total}"
        git status
        git add mathFun.sh
        git status
        git commit -m "${total}"
        git status
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    subtraction
}

function multiplacation() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $(($RANDOM % 25)))
    rand2=$(echo $(($RANDOM % 25)))
    sum=$(echo $((${rand1} * ${rand2})))

    echo "What is" ${rand1} * ${rand2} "? " && read answer

    if [[ ${answer} == ${sum} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score For Multiplacation: ${total}"
        git status
        git add mathFun.sh
        git status
        git commit -m "${total}"
        git status
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    multiplacation
}

function division() {
    green='\033[0;32m'
    gray='\033[0;37m'
    rand1=$(echo $(($RANDOM % 25)))
    rand2=$(echo $(($RANDOM % 25)))
    if [[ ${rand1} -lt ${rand2} ]]; then
        sum=$(echo $((${rand2} / ${rand1})))
        echo "What is" ${rand2} / ${rand1} "? " && read answer
    else
        sum=$(echo $((${rand1} / ${rand2})))
        echo "What is" ${rand1} / ${rand2} "? " && read answer
    fi

    if [[ ${answer} == ${sum} ]]; then
        echo -e ${green}"correct"${gray}
        score+=(1)
        total=${#score[@]}
        echo "Current Score : ${total}"
    else
        echo "incorrect"
        total=${#score[@]}
        echo "Final Score For Division: ${total}"
        
        git status
        git add mathFun.sh
        git status
        git commit -m "${total}"
        git status
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    division
}

# while true; do
#     addition
# done

case ${1} in

add)
    addition
    ;;

     sub)
       subtraction
       ;;

     mul)
       multiplacation
       ;;

     div)
        division
       ;;
esac