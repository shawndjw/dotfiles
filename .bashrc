#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

set -o vi

function md() {
  pandoc --to pdf $1 > /tmp/$1.pdf
  xdg-open /tmp/$1.pdf
}

function pkm() {
  cd ~/Documents/PKM/
  if [ -z "$1" ]; then
    markdown-oxide daily
  else
    markdown-oxide $1
  fi
}

function wod() {
  cd ~/Documents/PKM/Workouts/Crossfit
  if [ -z "$1" ]; then
    markdown-oxide daily
  else
    markdown-oxide $1
  fi
}

alias alz='cd ~/work/ito/cbs-alz-bicep && nvim .'
alias vi='nvim'
alias pacman='sudo pacman'
alias adsearch='. ~/.ldap_env; LDAPTLS_REQCERT=never ldapsearch -y ~/.ldap -x -o ldif-wrap=no -H $LDAP_HOST -s sub -D "$LDAP_USER" -b "$LDAP_BASE" -W'
alias sw='ssh -Y 10.0.0.11'
alias k='kubectl'
alias arecord='arecord -D hw:4,0 -f cd -t wav'


function ns() {
  if [ ! -z "$1" ]; then
    kubectl config set-context --current --namespace=${1}
  fi
  NS=$(kubectl config view --minify | grep namespace: | awk '{print $NF}')
  echo "Current namespace: $NS"
}

function aks() {
  local INSTANCE=$1
  local AKS=""
  case "$INSTANCE" in
    dev01)
      SUBSCRIPTION=fcc63316-3030-43c9-b243-7c0a2a2c66f1
      RG="rg-dev-aks-01-cc"
      AKS="aks-dev-01-cc"
      ;;
    qa01)
      SUBSCRIPTION=61e635c2-c3cd-4e2e-a9e8-2ea0d4a7377d
      RG="rg-qa-aks-01-cc"
      AKS="aks-qa-01-cc"
      ;;
    prd01)
      SUBSCRIPTION=d504d08e-be2c-4147-81ae-f98a69bd2c51
      RG="rg-prd-aks-01-cc"
      AKS="aks-prd-01-cc"
      ;;
    drprd01)
      SUBSCRIPTION=d504d08e-be2c-4147-81ae-f98a69bd2c51
      RG="rg-prd-aks-01-ce"
      AKS="aks-prd-01-ce"
      ;;
    "")
      echo "Usage: aks <dev01|qa01|prd01|drprd01>" >&2
      ;;
    *)
      echo "Invalid instance: '$INSTANCE'" >&2
      echo "Usage: aks <dev01|qa01|prd01|drprd01>" >&2
      ;;
  esac

  if [ ! -z "$AKS" ]; then
    echo "[Info] Connecting to $(echo $INSTANCE | tr '[:lower:]' '[:upper:]') server: $AKS"
    az account set --subscription $SUBSCRIPTION
    az aks get-credentials --resource-group $RG --name $AKS --overwrite-existing
    kubelogin convert-kubeconfig -l azurecli
  fi
}



function azpsql() {
  local INSTANCE=$1
  local SERVER=""
  case "$INSTANCE" in
    dev)
      SERVER="psql-dev-aks-02-cc.postgres.database.azure.com"
      ;;
    qa)
      SERVER="psql-qa-aks-02-cc.postgres.database.azure.com"
      ;;
    prd)
      SERVER="psql-prd-aks-01-cc.postgres.database.azure.com"
      ;;
    "")
      echo "Usage: azpsql <dev|qa|prd>" >&2
      exit 1
      ;;
    *)
      echo "Invalid instance: '$INSTANCE'" >&2
      echo "Usage: azpsql <dev|qa|prd>" >&2
      exit 1
      ;;
  esac

  token=$(az account get-access-token --resource-type oss-rdbms --query "accessToken" -o tsv)
  echo "[Info] Connecting to $(echo $INSTANCE | tr '[:lower:]' '[:upper:]') server: $SERVER"
  PGPASSWORD=$token psql -h $SERVER -U "ALZ - Database Administrators" postgres
}

function azmysql() {
  local INSTANCE=$1
  local SERVER=""
  case "$INSTANCE" in
    dev)
      SERVER="mysql-dev-aks-01-cc.mysql.database.azure.com"
      ;;
    qa)
      SERVER="mysql-qa-aks-01-cc.mysql.database.azure.com"
      ;;
    prd)
      SERVER="mysql-prd-aks-01-cc.mysql.database.azure.com"
      ;;
    "")
      echo "Usage: azmysql <dev|qa|prd>" >&2
      exit 1
      ;;
    *)
      echo "Invalid instance: '$INSTANCE'" >&2
      echo "Usage: azmysql <dev|qa|prd>" >&2
      exit 1
      ;;
  esac

  token=$(az account get-access-token --resource-type oss-rdbms --query "accessToken" -o tsv)
  echo "[Info] Connecting to $(echo $INSTANCE | tr '[:lower:]' '[:upper:]') server: $SERVER"
  mariadb -h $SERVER --user "ALZ - Database Administrators" --password="$token"
}



function dlogs() {
  az monitor log-analytics query --workspace 942defc2-e8bf-411e-b090-811894adc90e --analytics-query "$@"
}

function plogs() {
  az monitor log-analytics query --workspace 0a451818-101f-4600-a7a1-65431a326483 --analytics-query "$@"
}

# add Pulumi to the PATH
export PATH=$PATH:/home/shawn/.pulumi/bin

export TERMINAL=kitty
