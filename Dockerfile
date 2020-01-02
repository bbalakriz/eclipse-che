FROM quay.io/openshiftio/che-centos_jdk8
USER root

ENV FINDBUGS_HOME=/opt/findbugs/findbugs-3.0.1/bin
ENV PATH=$FINDBUGS_HOME:/opt/gradle/gradle-5.3/bin:$PATH

#Install latest cobertura that's available in the yum repos
RUN yum -y install cobertura

#Install Gradle 5.3 and set the PATH for all users
RUN wget https://services.gradle.org/distributions/gradle-5.3-bin.zip && \
    mkdir /opt/gradle && \
    unzip -d /opt/gradle gradle-5.3-bin.zip && \
    #export PATH=$PATH:/opt/gradle/gradle-5.3/bin && \
    rm gradle-5.3-bin.zip && \
    ##Install Findbugs
    wget http://prdownloads.sourceforge.net/findbugs/findbugs-3.0.1.tar.gz  && \
    mkdir /opt/findbugs && \
    tar -xzf findbugs-3.0.1.tar.gz --directory /opt/findbugs && \
    echo $(gradle -v) && \
    findbugs -version

#curl -LO https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && tar xvf openshift-#origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
#RUN mv openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit/oc /usr/local/bin/oc && chmod +x /usr/local/bin/oc
#RUN curl -L https://github.com/redhat-developer/odo/raw/master/scripts/install.sh | bash 
#RUN echo $'[centos]\nname=CentOS-7\nbaseurl=http://distro.ibiblio.org/centos/7.6.1810/os/x86_64/\nenabled=1 \ngpgcheck=0'>> /etc/yum.repos.d/centos.repo
#RUN yum install -y zsh
#RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
#Adding this line to trigger the build using Quay Build trigger
