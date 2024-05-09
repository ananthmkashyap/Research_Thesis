# Use a base image with Python and necessary dependencies
FROM pytorch/pytorch:latest

# Set the working directory in the container
WORKDIR /app

# Copy the training script and data into the container
COPY main.py  /app/main.py
COPY requirements.txt  /app/requirements.txt
COPY run.sh  /app/run.sh

RUN pip install -r requirements.txt
# Command to run the training script
CMD ["bash", "/app/run.sh"]