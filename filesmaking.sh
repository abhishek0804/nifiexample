#!/bin/bash


#Creating the req files and folders
cd /tmp/
mkdir -p /tmp/pi
chmod 777 -R /tmp/pi



cd /tmp/pi
wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz
tar -zxvf GeoLite2-City.tar.gz

cd /tmp/pi/GeoLite2-City_*
cp GeoLite2-City.mmdb /tmp/pi


#creating the python file
echo '

import datetime

def temperature(hour,minute):
    if (hour == "0"):
        return "26.00"
    elif (hour == "1"):
        return "25.55"
    elif (hour == "2"):
        return "25.10"
    elif (hour == "3"):
        return "24.67"
    elif (hour == "4"):
        return "24.56"
    elif (hour == "5"):
        return "24.30"
    elif (hour == "6"):
        return "23.77"
    elif (hour == "7"):
        return "24.51"
    elif (hour == "8"):
        return "26.23"
    elif (hour == "9"):
        return "28.13"
    elif (hour == "10"):
        if (minute <= 15):
            return "28.70"
        elif (minute<=30):
            return "29.00"
        elif (minute<=45):
            return "29.70"
        else:
            return "29.91"
    elif (hour == "11"):
        if (minute <= 15):
            return "29.98"
        elif (minute<=30):
            return "30.70"
        elif (minute<=45):
            return "31.65"
        else:
            return "32.13"
    elif (hour == "12"):
        if (minute <= 15):
            return "32.43"
        elif (minute<=30):
            return "32.55"
        elif (minute<=45):
            return "33.01"
        else:
            return "33.22"
    elif (hour == "13"):
        if (minute <= 15):
            return "33.35"
        elif (minute<=30):
            return "34.09"
        elif (minute<=45):
            return "34.63"
        else:
            return "34.96"
    elif (hour == "14"):
        if (minute <= 15):
            return "35.35"
        elif (minute<=30):
            return "35.29"
        elif (minute<=45):
            return "34.63"
        else:
            return "34.09"
    elif (hour == "15"):
        if (minute <= 15):
            return "34.00"
        elif (minute<=30):
            return "33.83"
        elif (minute<=45):
            return "33.61"
        else:
            return "33.22"
    elif (hour == "16"):
        if (minute <= 15):
            return "33.05"
        elif (minute<=30):
            return "32.69"
        elif (minute<=45):
            return "31.69"
        else:
            return "31.09"
    elif (hour == "17"):
        if (minute <= 15):
            return "30.89"
        elif (minute<=30):
            return "30.54"
        elif (minute<=45):
            return "30.49"
        else:
            return "29.97"
    elif (hour == "18"):
        if (minute <= 15):
            return "29.57"
        elif (minute<=30):
            return "29.43"
        elif (minute<=45):
            return "29.23"
        else:
            return "28.77"
    elif (hour == "19"):
        if (minute <= 15):
            return "28.43"
        elif (minute <= 30):
            return "28.30"
        elif (minute <= 45):
            return "27.89"
        else:
            return "27.64"
    elif (hour == "20"):
        if (minute <= 15):
            return "27.57"
        elif (minute<=30):
            return "27.40"
        elif (minute<=45):
            return "27.15"
        else:
            return "26.67"
    elif (hour == "21"):
        if (minute <= 15):
            return "26.10"
        elif (minute<=30):
            return "25.90"
        elif (minute<=45):
            return "25.66"
        else:
            return "25.39"
    elif (hour == "22"):
        if (minute <= 15):
            return "25.32"
        elif (minute<=30):
            return "25.29"
        elif (minute<=45):
            return "25.10"
        else:
            return "25.05"
    elif (hour == "23"):
        if (minute <= 15):
            return "24.96"
        elif (minute<=30):
            return "24.63"
        elif (minute<=45):
            return "24.22"
        else:
            return "24.97"
    else:
        print ("hour is not present")

		
		
def humidity(hour):
    if (hour == "0"):
        return "78.00"
    elif (hour == "1"):
        return "81.00"
    elif (hour == "2"):
        return "86.00"
    elif (hour == "3"):
        return "91.00"
    elif (hour == "4"):
        return "94.00"
    elif (hour == "5"):
        return "96.00"
    elif (hour == "6"):
        return "98.00"
    elif (hour == "7"):
        return "96.00"
    elif (hour == "8"):
        return "86.00"
    elif (hour == "8"):
        return "72.00"	
    elif (hour == "9"):
        return "58.00"			
    elif (hour == "10"):
        return "47.00"
    elif (hour == "11"):
        return "47.00"
    elif (hour == "12"):
        return "38.00"
    elif (hour == "13"):
        return "33.00"
    elif (hour == "14"):
        return "35.16"
    elif (hour == "15"):
        return "32.00"
    elif (hour == "16"):
        return "34.00"
    elif (hour == "17"):
        return "38.00"
    elif (hour == "18"):
        return "42.00"
    elif (hour == "19"):
        return "28.43"
    elif (hour == "20"):
        return "46.00"
    elif (hour == "21"):
        return "50.00"
    elif (hour == "22"):
        return "54.00"
    elif (hour == "23"):
        return "63.96"	    	
    else:
        print ("hour is not present")

def pressure(hour):
    if (hour == "0"):
        return "10.09"
    elif (hour == "1"):
        return "20.01"
    elif (hour == "2"):
        return "25.10"
    elif (hour == "3"):
        return "24.77"
    elif (hour == "4"):
        return "24.56"
    elif (hour == "5"):
        return "24.30"
    elif (hour == "6"):
        return "23.07"
    elif (hour == "7"):
        return "24.71"
    elif (hour == "8"):
        return "26.23"
    elif (hour == "9"):
        return "21.43"		
    elif (hour == "10"):
        return "11.22"
    elif (hour == "11"):
        return "30.24"
    elif (hour == "12"):
        return "32.19"
    elif (hour == "13"):
        return "13.22"
    elif (hour == "14"):
        return "25.16"
    elif (hour == "15"):
        return "31.09"
    elif (hour == "16"):
        return "22.22"
    elif (hour == "17"):
        return "22.89"
    elif (hour == "18"):
        return "12.57"
    elif (hour == "19"):
        return "22.43"
    elif (hour == "20"):
        return "23.19"
    elif (hour == "21"):
        return "22.12"
    elif (hour == "22"):
        return "27.32"
    elif (hour == "23"):
        return "22.90"	    	
    else:
        print ("hour is not present")		
		
		
print "Serial = " + "00000000ae93a733"
print "Time = \"" + str(datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%SZ")) + "\""
print "Temperature_F = " + str(temperature(str(datetime.datetime.now().hour)))
print "Humidity_PRH = " + str(humidity(str(datetime.datetime.now().hour)))
print "Pressure_In = " + str(pressure(str(datetime.datetime.now().hour)))
print "Public_IP = " + "192.175.27.10"  
#print("temperature"+temperature(str(datetime.datetime.now().hour)))  
#@app.route('/todo', methods=['GET'])
#def get_tasks():
#   return jsonify({'tasks': tasks})


#@app.route("/")
#def hello():
#    return jsonify({"time": str(datetime.datetime.now()),"name": "abhishek","hour": str(datetime.datetime.now().hour), "temperature": temperature(str(datetime.datetime.now().hour)),"humidity": humidity(str(datetime.datetime.now().hour))})

#if __name__ == '__main__':
#    app.run(debug=True)


' >/tmp/pi/weather.py





#Creating table in hbase and dir in hdfs
source config.properties
#echo "$pass" | kinit $user
echo "create 'sense_hat_logs','weather'" | hbase shell

sudo -u hdfs hdfs dfs -mkdir -p /sandbox/tutorial-files/820/nifi/output/raw-data
sudo -u hdfs hdfs dfs -chmod -R 777 /sandbox/tutorial-files/820/nifi/output/raw-data
