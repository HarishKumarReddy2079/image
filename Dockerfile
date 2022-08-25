# start by pulling the python image
FROM python:3.9.13
WORKDIR /image-classifier
COPY . /image-classifier

# copy the requirements file into the image
COPY ./requirements.txt /image-classifier/requirements.txt

RUN pip install --upgrade pip
RUN apt-get update && apt-get install -y python3-pip
# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# copy every content from the local file to the image
EXPOSE 8502
EXPOSE 8501

# configure the container to run in an executed manner
ENTRYPOINT [ "python3" ]

CMD ["app.py" ]