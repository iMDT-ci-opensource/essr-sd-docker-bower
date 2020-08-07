#!/bin/bash
while [ true ] ; do
	bower install;
	ecode=$?;
	if [ $ecode = 0 ]; then
		break;
	else
		echo "bower install failed, running again"
	fi;
done
