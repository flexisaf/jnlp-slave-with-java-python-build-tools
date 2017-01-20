FROM cloudbees/jnlp-slave-with-java-build-tools

LABEL maintainer "AbdulBasit KABIR"

RUN id
USER root

RUN apt-get install python	--force-yes -y \
	apt-get install python-setuptools --force-yes -y 	\
	apt-get install build-essential --force-yes -y
	
RUN pip install --upgrade pip  \
	pip install --upgrade requests \
	pip install fabric

ENTRYPOINT ["/opt/bin/entry_point.sh", "/usr/local/bin/jenkins-slave"]