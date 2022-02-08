# Replacing JDK 11 to JDK 8 (make sure to replacing the right line)
sed -i '132s/.*/JAVA_HOME=\/opt\/oracle-jdk1.8.0_131/' ~/.bashrc

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/oracle-jdk1.8.0_131/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/oracle-jdk1.8.0_131/bin/javac" 1

sudo update-alternatives --set java /opt/oracle-jdk1.8.0_131/bin/java
sudo update-alternatives --set javac /opt/oracle-jdk1.8.0_131/bin/javac

java -version
javac -version
