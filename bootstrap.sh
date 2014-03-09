apt-get update
apt-get install -y openjdk-7-jdk unzip

wget -O /tmp/apache-archiva-2.0.0-bin.zip http://apache-mirror.rbc.ru/pub/apache/archiva/2.0.0/binaries/apache-archiva-2.0.0-bin.zip
rm -r /opt/apache-archiva-2.0.0
unzip /tmp/apache-archiva-2.0.0-bin.zip -d  /opt/

# Fix for the archiva-2.0.0 failing under Ubuntu:
wget -O /tmp/default-archiva.xml http://svn.apache.org/viewvc/archiva/trunk/archiva-modules/archiva-base/archiva-configuration/src/main/resources/org/apache/archiva/configuration/default-archiva.xml?revision=1571882&view=co&pathrev=1571882
cp -f /tmp/default-archiva.xml /opt/apache-archiva-2.0.0/conf/archiva.xml
