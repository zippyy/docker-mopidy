FROM jprjr/ubuntu-base:14.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y build-essential \
          python-dev \
          python-pip
RUN apt-get install -y python-gst-1.0 \
    gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 \
    gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools libasound2-dev gstreamer1.0-alsa \
    wget gstreamer1.0-libav

RUN pip install -U  Mopidy
RUN pip install -U Mopidy-ALSAMixer
RUN pip install Mopidy-Yamaha

RUN wget -q -O - http://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN echo "deb http://apt.mopidy.com/ stable main contrib non-free" > /etc/apt/sources.list.d/mopidy.list
RUN echo "deb-src http://apt.mopidy.com/ stable main contrib non-free" >> /etc/apt/sources.list.d/mopidy.list
RUN apt-get install -y --force-yes apt-transport-https
RUN apt-get update && \
    apt-get install -y libspotify12 libspotify-dev \
    libffi-dev libffi6
RUN pip install Mopidy-Spotify
RUN pip install  Mopidy-Somafm
RUN pip install  Mopidy-Soundcloud
RUN pip install beets
RUN pip install Mopidy-BeetsLocal

COPY root /