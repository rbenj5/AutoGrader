# Start from a PyTorch base image with GPU support
FROM pytorch/pytorch:latest

# Update the system and install necessary software
RUN apt-get update && apt-get install -y \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook, openai and other useful stuff.
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Set up the working directory
WORKDIR /workspace

# Change the ownership and permissions of /.local and /workspace
RUN mkdir /.local /.jupyter
RUN chmod -R 777 /.local /.jupyter /workspace

# When the container launches, start a Jupyter Notebook server
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser"]

