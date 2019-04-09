FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /demo
WORKDIR /demo
COPY . /demo
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
EXPOSE 8000
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]