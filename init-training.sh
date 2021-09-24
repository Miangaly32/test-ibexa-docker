
#!/bin/bash

# basic settings

db_user=ezplatform
db_password=ezplatform
db_name=ezplatform-training
training_path=/var/www/html/training/ezplatform

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

msgStart="#########################################
"
msgEnd="
#########################################
"

########################
# main training functions
#

trainingTypeSettings() {
    case $1 in
        "advanced" )
            echo advanced_start_3.3 steps/sql/04-training.sql advanced-training
            ;;
        "developer")
            echo developer_start_3.3 steps/sql/00_clean_db.sql developer-training
            ;;
    esac
}

# Init "$vmtype" "$trainingType" "$trainingPrefix"
Init() {
    cd $training_path
   
    settings=($(trainingTypeSettings $2))

    Exec "Checkout ${settings[0]}" "git checkout ${settings[0]};composer dumpautoload;"
    Exec "Reset Database" "mysql -u$db_user -p$db_password $db_name < ${settings[1]}; php bin/console c:c"
    Exec "Create vendor.tgz" "tar -czf vendor.tgz --exclude='*.mp4' --exclude='*.mp3' vendor"
    Exec "Create Training branch" "CreateBranch '${settings[2]}' '$1' '$3'"
}

# CreateBranch "developer-training|advanced-training" "trainer|students" "prefix"
CreateBranch() {
    case $2 in
        "trainer" )
            git checkout --orphan "$3_$1"
            echo vendor.tgz >> .gitignore
            echo /config/graphql/types/ezplatform/ >> .gitignore
            echo ide-twig.json >> .gitignore
            echo /public/assets/ezplatform/ >> .gitignore

            git add .; git commit -m 'Init';
            # read/write remote for trainer
            git remote add training-public "git@gitlab.com:ez-ps/training-public.git"
	    git push --set-upstream training-public "$3_$1"
            ;;
        "students")
            # read only remote for students
            git remote add training-public "https://gitlab.com/ez-ps/training-public.git"
            git fetch training-public "$3_$1"
            git checkout "$3_$1"
            git checkout -b "$3_$1_dev"
	    ;;
    esac
}

#
Cleanup() {
    cd
    rm .bash_history
    rm .config/composer/auth.json
    rm .ssh/id_rsa*
    cp authorized_keys_students .ssh/authorized_keys;rm authorized_keys;
}

########################
# helper functions
#

# Confirm "question" "command"
Confirm() {
    # forces input
    while true; do
        read -p "$1 (y/n) ?" choice
        case "$choice" in 
            [Yy]* )
                eval "$2"
                printf "${GREEN}$2${NC}: Done\n"; break;;
            [Nn]*  )
                printf "${RED}$2${NC}: Was Skipped\n"; break;;
            * )
                printf "$1 (y/n) ? Make your Choice\n";;
        esac
    done
}

# Exec "question" "command"
Exec() {
    eval "$2"
    printf "${GREEN}$2${NC}: Done\n"
}

# Cleanup with prior check : host == AWS Linux-VM
SafeCleanup() {
    # check if on a VM
    checkVar=$(hostnamectl)
    searchWord='Linux 5.4.*-aws'
    if grep -q "${searchWord}" <<< "$checkVar"
    then
        # do cleanup
        echo "DO CLEANUP"
        Cleanup
    else
        printf  "%s${RED}CLEANUP NOT DONE - this might not be a training VM${NC} - cannot find '${searchWord}' in hostnamectl.%s" "$msgStart" "$msgEnd"
        exit 1
    fi
}


# validation
showValidationError() {
  printf "%s\tInput Error in ${RED}$1${NC} - ${RED}'$2'${NC} is not allowed.\
\n\tOperation was canceled!%s" "$msgStart" "$msgEnd"

  printf "\tAllowed 1st parameter:\n\t${GREEN}"
  printf '%s\n\t' "${targetGroup[@]}"
  printf "${NC}Allowed 2nd parameter:\n\t${GREEN}"
  printf '%s\n\t' "${trainingType[@]}"
  printf "${NC}Allowed 3rd parameter:\n\t"
  printf "Something descriptive like ${GREEN}DACH-2021-2-20${NC}"
  printf "\n##########################\n"
  exit 1;
}

########################
# Script starts
#

source init-training-completion.sh

# pre check
if [ "$(git diff --name-only HEAD | wc -l)" != "0" ]
then
  printf "%s\tThere are ${RED}modifications in your working directory.${NC}\n\tOperation was canceled!%s" "$msgStart" "$msgEnd"
  # exit 0
fi

targetGroup=($_targetGroup)
trainingType=($_trainingType)

for i in "${targetGroup[@]}"; do
  if [[ "$i" != "$1" ]]
  then
    if [[ "$i" = ${targetGroup[-1]} ]]
    then
      showValidationError 'targetGroup' $1
    fi
    continue
  else
    break
  fi
done

for i in "${trainingType[@]}"; do
  if [[ "$i" != "$2" ]]
  then
    if [[ "$i" = ${trainingType[-1]} ]]
    then
      showValidationError 'trainingType' $2
    fi
    continue
  else
    break
  fi
done

if [[ "" = "$3" ]]
then
  showValidationError 'traingPrefix' $3
fi


vmType="$1"
trainingType="$2"
trainingPrefix=$(echo $3 | sed 's/ /-/g')
    
res=$(trainingTypeSettings $2) 
settings=($res)

# input is collected here
# final check
printf "\tvmType:"
printf "\n\t${GREEN}$vmType${NC}"
printf "\n\tTrainingType:"
printf "\n\t${GREEN}$trainingType${NC}"
printf "\n\tTraining Branch:"
printf "\n\t${GREEN}$trainingPrefix-${settings[2]}${NC}\n\t"

read -p "Are you sure - You want to Proceed (Yn) ? " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    printf "\n\tTRY AGAIN!\n"    
    exit 0
fi
printf "\n"

case $vmType in
    "trainer" )
        Init "$vmType" "$trainingType" "$trainingPrefix"
        ;;
    "students")
        Init "$vmType" "$trainingType" "$trainingPrefix"
        Exec "Cleanup Students VM" "SafeCleanup"
        ;;
    *) printf "${RED}Invalid option $vmtype${NC}\n";;
esac

exit 0
