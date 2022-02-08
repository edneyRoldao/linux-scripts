# Replacing JDK 8 to JDK 11 (make sure to replacing the right line)
sed -i '132s/.*/JAVA_HOME=\/opt\/jdk-11.0.1/' ~/.bashrc

sudo update-alternatives --install "/usr/bin/java" "java" "/opt/jdk-11.0.1/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/jdk-11.0.1/bin/javac" 1

sudo update-alternatives --set java /opt/jdk-11.0.1/bin/java
sudo update-alternatives --set javac /opt/jdk-11.0.1/bin/javac

java -version
javac -version
