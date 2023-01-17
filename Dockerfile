FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu18.04
  
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.8 python3-pip python3-setuptools python3-dev build-essential && \
    python3 -m pip install -U pip && \
    pip3 install --upgrade setuptools && \
    echo "alias python=python3" >> ~/.bash_aliases

WORKDIR /tale

COPY requirements.txt ./requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN pip3 install jupyter

CMD JUPYTER_PATH=/src/src/ jupyter notebook --no-browser --port=8888 --ip=0.0.0.0 --allow-root 
