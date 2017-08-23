FROM ubuntu:15.04

RUN apt-get update && apt-get install -y \
ffmpeg \
frei0r-plugins \
git \
python \
python-scipy \
python-pip \
python-matplotlib \
software-properties-common \
wget \
libfreetype6-dev \
libpng-dev \
pkg-config

RUN pip install -U distribute

RUN pip install \
docopt \
git+git://github.com/bmcfee/librosa.git \
joblib

RUN wget --no-check-certificate http://www.mega-nerd.com/SRC/libsamplerate-0.1.8.tar.gz
RUN tar xvfz libsamplerate-0.1.8.tar.gz
RUN cd libsamplerate-0.1.8 && ./configure && make && make install

RUN pip install scikits.samplerate
RUN git clone https://github.com/dpwe/audfprint.git

ENTRYPOINT ["python", "audfprint/audfprint.py"]
