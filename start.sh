while getopts "hc" OPTION
do
	case $OPTION in
        h)
            echo "Usage: ./start.sh <flags>"
            echo "-h   Displays this help menu"
            echo "-c   Clears existing Vagrant configurations"
            exit
            ;;
		c)
            echo '----------------------------------------'
            echo 'Removing old Vagrant configuration files...'
            echo '----------------------------------------'
            rm -r vagrant/.vagrant/
			;;
	esac
done

pwd
echo '----------------------------------------'
echo 'Changing to directory "vagrant/"...'
echo '----------------------------------------'
cd vagrant/
pwd

echo '----------------------------------------'
echo 'Adding or updating box "ubuntu/trusty64"...'
echo '----------------------------------------'
vagrant box add ubuntu/trusty64

echo '----------------------------------------'
echo 'Halting existing instances of Vagrant to clear port collisions...'
echo 'If you still experience port errors try rebooting your host'
echo '----------------------------------------'
vagrant halt


echo '----------------------------------------'
echo 'Starting Vagrant...'
echo '----------------------------------------'
vagrant up

echo '----------------------------------------'
echo 'Running provisioners...'
echo '----------------------------------------'
vagrant provision



echo '----------------------------------------'
echo 'END OF START SCRIPT'
echo 'If all went well, you may visit "localhost:4532" in your host browser'
echo '----------------------------------------'