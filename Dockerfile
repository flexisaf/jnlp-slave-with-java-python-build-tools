FROM cloudbees/jnlp-slave-with-java-build-tools

LABEL maintainer "AbdulBasit KABIR <abdulbasit.kabir@flexisaf.com>"

RUN id
USER root

RUN apt-get update && apt-get install -y \
        python \
        python-dev \
        libffi-dev \
        libssl-dev \
        python-pip

RUN pip install fabric --upgrade \
        requests --upgrade \
        cffi --upgrade


RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
        && unzip awscli-bundle.zip \
        && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

USER jenkins

ENTRYPOINT ["/opt/bin/entry_point.sh", "/usr/local/bin/jenkins-slave"]
