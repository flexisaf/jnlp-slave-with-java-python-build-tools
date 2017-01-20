FROM cloudbees/jnlp-slave-with-java-build-tools

LABEL maintainer "AbdulBasit KABIR [abdulbasit.kabir@flexisaf,com]"

RUN id
USER root

RUN apt-get update && apt-get install -y \
	python \
	python-dev \
	libffi-dev \
	libssl-dev \
	python-pip
	
RUN pip install fabric --upgrade \
	Requests --upgrade

ENTRYPOINT ["/opt/bin/entry_point.sh", "/usr/local/bin/jenkins-slave"]