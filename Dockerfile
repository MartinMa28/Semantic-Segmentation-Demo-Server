FROM python:3

ARG USER

ENV PYTHONUNBUFFERED 1

# Add a non-root user.
ENV USER ${USER}
ENV HOME /home/${USER}
RUN adduser --disabled-password --gecos "" ${USER}

RUN mkdir ${HOME}/demo
WORKDIR ${HOME}/demo

# Copy necessary files to the proper destinations inside the container.
COPY segmentation_demo ${HOME}/demo/segmentation_demo
COPY polls ${HOME}/demo/polls
COPY manage.py ${HOME}/demo/manage.py
COPY requirements.txt ${HOME}/demo/requirements.txt

# Install all of packages using root user.
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# Change the owner of the work directory suing root user.
RUN chown -R ${USER}:${USER} ${HOME}/demo

# Run all commands below as 'django' user.
USER ${USER}


EXPOSE 8000
CMD echo "Hello!"