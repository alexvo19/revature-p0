#!/bin/bash

#automate the azure-ad user actions

commands=$1


# verify az
if [ -z $(which az) ]
then
 echo "no azure-cli"
 exit 1
fi


#create func
create()
{
    password=Donthackme(987
    domain=alexvo19gmail.onmicrosoft.com
    displayname=$1
    subscription=$2
    userprincipalname=$displayname@$domain

    #create user
    az ad user create \
     --display-name $displayname \
     --password $password \
     --user-principal-name $userprincipalname \
     --subscription $subscription

}

#assign role
assign ()
{
    action=$1 
    userprincipalname=$2 
    role=$3 

    #checks if user exits
    user=$(az ad user list --query [].userPrincipalName | grep $userprincipalname)

    #conditional 
    if [ -z $user ]
    then
     echo "user doesn't exist"
     exit 1
    fi

    az role assignment $action --assignee $userprincipalname --role $role
}


#delete user
delete()
{
    userprincipalname=$1

    #checks if user exits
    user=$(az ad user list --query [].userPrincipalName | grep $userprincipalname)

    #conditional 
    if [ -z $user ]
    then
     echo "user doesn't exist"
     exit 1
    fi

    az ad user delete --upn-or-object-id $userprincipalname
}


#runs different function based on argument given

case "$commands" in
  "create")
    username=$2
    subscription=$3
    create $username $subscription
  ;;
  "assign")
    action=$2
    userprincipalname=$3
    role=$4
    assign $action $userprincipalname $role
  ;;
  "delete")
    userprincipalname=$2
    delete $userprincipalname
  ;;
esac
