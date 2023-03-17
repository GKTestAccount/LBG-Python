# Python base image
FROM python:3.10.4

#Create and set the working directory inside the image named 'aj-sp2'
WORKDIR /sp2

# Execute a pip install command using the list 'requirements.txt'
RUN pip install Flask

# Copy the app file into the image working directory
RUN git clone https://github.com/GKTestAccount/LBG-Python.git
WORKDIR /sp2/LBG-Python
RUN git pull
RUN pip install -r requirements.txt
# State the listening port for the container.
# The app's code does not actually specify the port, so it would be useful to include here.
EXPOSE 9000

# Run 'python lbg.py' on container start-up. This is the main process. 
ENTRYPOINT ["python", "lbg.py"]

