# Replacing JDK 8 to JDK 11 (make sure to replacing the right line)
sed -i '132s/.*/JAVA_HOME=\/opt\/jdk-11.0.1/' ~/.bashrc
