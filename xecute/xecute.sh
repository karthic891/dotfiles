#!/bin/bash

echo "$@"
program=$1
folder=""
command="nohup "

if [ $program = "eclipse" ]
then
    command=$command"bash -c ~/serverstuff/eclipse/eclipse"
elif [ $program = "tor" ]
then
    command=$command"bash -c ~/serverstuff/tor-browser_en-US/Browser/start-tor-browser"
elif [ $program = "ssh" ]
then
    command=$command"gnome-terminal"
elif [[ $program = "thunderbird" || $program = "tb" ]]
then
    command=$command"thunderbird"
elif [[ $program = "postman" ]]
then
    command=$command"google-chrome --profile-directory=Default --app-id=fhbjgbiflinjbdggehcddcbncdddomop"
elif [[ $program = "calc" ]]
then
    command=$command"gnome-calculator"
elif [[ $program = "start-tomcat" ]]
then
    # Since we have to pass cmd line parameters i.e., jpda and start, bash and nohup meddle with spaces and hence bash does not recognize the parameters
    # Hence we execute the command inside this if and return from here
    folder="/home/karthic/serverstuff/apache-tomcat-8.0.23/"
    cd $folder
    # Read this for single quote needed in different lines:
    # http://stackoverflow.com/questions/12136948/in-bash-why-do-shell-commands-ignore-quotes-in-arguments-when-the-arguments-are
    command="bash -c 'bin/catalina.sh"
    arguments=" jpda start'"
    eval $command $arguments
    exit 1
elif [[ $program = 'stop-tomcat' ]]
then
    folder="/home/karthic/serverstuff/apache-tomcat-8.0.23/"
    cd $folder
    # Read this for single quote needed in different lines:
    # http://stackoverflow.com/questions/12136948/in-bash-why-do-shell-commands-ignore-quotes-in-arguments-when-the-arguments-are
    command="bash -c 'bin/catalina.sh"
    arguments=" stop'"
    eval $command $arguments
    exit 1
elif [[ $program = 'kill-tomcat' ]]
then
    pids=`ps -ef | grep tomcat | grep -v 'grep' | awk '{print $2}'`
    for pid in $pids
    do
	echo "Killing "$pid"..."
	kill -9 $pid
	# Exit after the first pid as that's usually the actual pid to be killed
	exit 1
    done
elif [[ $program = 'start-redis' ]]
then
    command=$command"redis-server"
else
    command=$command$program
fi

if [ ! -z $folder ]
then
    echo "going in"
    cd "$folder"
fi
command=$command" &"
eval $command
