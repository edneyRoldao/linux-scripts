# Replacing JDK 11 to JDK 8 (make sure to replacing the right line)
sed -i '132s/.*/JAVA_HOME=\/opt\/oracle-jdk1.8.0_131/' ~/.bashrc
