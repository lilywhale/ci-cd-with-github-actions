# Dockerfile to build a flask app
FROM python:3.8-slim

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt
COPY ./test_main.txt /app/test_main.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

# Run tests
CMD ["pytest", "-m", "unit"]
