for btn in `ls *.env -1 | grep -v sample`; do 
	NAME=`basename -s .env $btn`; 
	echo "Configuring $NAME";
	docker rm -fv dash-$NAME
	docker run -d --name=dash-$NAME --restart=always --net=host --env-file $NAME.env cgatay/dash-button-rpi
done;
