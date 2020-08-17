FROM python:3.7-slim-buster

# PYTHON PACKAGES
RUN pip3 install numpy
RUN pip3 install scipy
RUN pip3 install matplotlib
RUN pip3 install pandas
RUN pip3 install jupyter
RUN pip3 install jupyterlab
RUN pip3 install colour
RUN pip3 install seaborn
RUN pip3 install xlrd


# user id for jupyter
ARG user_id=1000

# MAKE JUPYTER USER
RUN useradd -ms /bin/bash jupyter
RUN usermod -u $user_id jupyter
RUN groupmod -g $user_id jupyter

USER jupyter

WORKDIR /home/jupyter

# MAKE DEAFULT CONFIG
RUN jupyter notebook --generate-config
RUN mkdir host_data

WORKDIR /home/jupyter/host_data
CMD python -m jupyter lab --ip=0.0.0.0 --no-browser --allow-root
