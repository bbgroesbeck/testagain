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
        echo "Final Score : ${total}"
        # git checkout main
        # git pull
        git checkout feature/tyler
        # git merge main
        git add mathFun.sh
        git commit -m "On $(date) $(whoami) score was ${total}"
        git push
        exit 1
    fi

    # echo "`echo $'\n'`"
    echo -e ${green}"Game Time! Taking Score!"${gray}
    # echo "`echo $'\n'`"
    addition
}

# while true; do
#     addition
# done

case ${1} in

add)
    addition
    ;;

    # PATTERN_2)
    #   STATEMENTS
    #   ;;

    # PATTERN_N)
    #   STATEMENTS
    #   ;;

    # *)
    #   STATEMENTS
    #   ;;
esac

