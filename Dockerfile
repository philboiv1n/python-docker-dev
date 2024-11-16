# Set base image
FROM python:3.13-alpine

# Set working directory in the container
WORKDIR /code

# Copy the dependencies file to the working directory and install
COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY ./src ./src

# Command to run on container start
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80", "--reload"]