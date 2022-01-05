if [[ -z ${1} ]]; then
    echo "i need 1 pos param"
    exit
fi

var1=file1.txt
var2=${1}

echo "welcome cohort 14 member" >${var1}

echo ${var1}
cat ${var1}
echo ${var2} "is in position 1"
echo ${1} "is in position 1"

echo "what is your name"
read username
echo "what is your password?"
read password
echo "hello ${username} if that's really you."

if [[ ${username} == "Bryce" ]] && [[ ${password} == "1234" ]]; then
    # echo "code: " $?
    echo "oh it is you"
else
    # echo "code: " $?
    echo "nope, not you"
    exit
fi
