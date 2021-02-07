FROM jetbrains/teamcity-agent:2020.2.2
USER root
RUN apt update && apt install wget && \
    wget https://github.com/github-release/github-release/releases/download/v0.9.0/linux-amd64-github-release.bz2 && \
    bzip2 -d linux-amd64-github-release.bz2 && \
    mv linux-amd64-github-release /usr/bin/github-release && \
    chmod +x /usr/bin/github-release && \
    wget -c https://download.java.net/java/ga/jdk11/openjdk-11_linux-x64_bin.tar.gz && \
    tar -xvf openjdk-11_linux-x64_bin.tar.gz && \
    rm openjdk-11_linux-x64_bin.tar.gz && \
    mkdir -p /usr/lib/jvm/jdk-11 && \
    mv jdk-11*/* /usr/lib/jvm/jdk-11/ && \
    update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-11/bin/java" 1020 && \
    update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-11/bin/javac" 1020 && \
    wget -c https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz && \
    tar -xvf openjdk-15.0.1_linux-x64_bin.tar.gz && \
    rm openjdk-15.0.1_linux-x64_bin.tar.gz && \
    mkdir -p /usr/lib/jvm/jdk-15 && \
    mv jdk-15*/* /usr/lib/jvm/jdk-15/
