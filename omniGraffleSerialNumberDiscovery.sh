#! /bin/bash
#Check if OmniGraffle 5 is installed
if [ -d /Applications/OmniGraffle\ Professional\ 5.app ]
then
	ogVersion=`defaults read /Applications/OmniGraffle\ Professional\ 5.app/Contents/Info CFBundleShortVersionString`
	userLicenses=`grep -A 1 Key /Users/*/Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle-*.omnilicense | grep string`
# if not see if OmniGraffle 6+ is installed
elif [ -d /Applications/OmniGraffle.app ]
then
	ogVersion=`defaults read /Applications/OmniGraffle.app/Contents/Info CFBundleShortVersionString`
	userLicenses=`grep -A 1 Key /Users/*/Library/Containers/com.omnigroup.OmniGraffle6/Data/Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle-*.omnilicense | grep string`
else
	ogVersion=0
fi

#If no version of OmniGraffle is installed exit
if [ $ogVersion = 0 ]
then
	echo "No Omnigraffle Installed"
	exit 0
fi

echo "OmniGraffle Version:" $ogVersion
echo ""
echo "User licenses"
echo "$userLicenses"

echo ""
echo ""

echo "Computer licenses"
grep -A 1 Key /Library/Application\ Support/Omni\ Group/Software\ Licenses/OmniGraffle-*.omnilicense | grep string