FROM docker.io/library/rust:latest

# install dependencies
RUN apt update && \
    apt install -y pulseaudio libasound2-dev libnotify-dev cmake

# configure pulseaudio
RUN sed -i 's/load-module module-native-protocol-unix/load-module module-native-protocol-unix auth-anonymous=1/g' /etc/pulse/system.pa
RUN sed -i 's/load-module module-always-sink//g' /etc/pulse/system.pa

# install mum-cli
RUN cargo install mum-cli

WORKDIR /app

COPY . .

RUN chmod +x /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]