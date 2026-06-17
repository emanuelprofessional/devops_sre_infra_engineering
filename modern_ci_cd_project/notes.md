# Overall Notes

-- Use docker ignore to remove files that should not be considered in the build process. Makes build process more seamless and decreases files under contexr
-- WORKDIR is the default folder docker uses inside the container for builds
-- CMD is the first command ran when the container starts from "docker run". The last CMD in a docker file is ran.
-- FROM is the base image. We use "python:3.12-slim" which means we are using a slim linux contianer with python 3.12 installed for our applicaiton.
-- Multi-Stage build only if you are running something with a compiler, larger dependinces, or a framework like react and angular.
-- port 6000 is a unsecure port so use another like 8000. There are more unsecure ports to look up.

# Development CMD

-- docker build -t flask-app:dev .
-- docker run -d -p 8000:5000 -e FLASK_DEBUG=1 --name flask-app flask-app:dev python app.py

# Production CMD

-- docker build -t flask-app:latest .
-- docker run -d -p 8000:5000 --name flask-app flask-app:latest