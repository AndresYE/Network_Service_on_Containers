FROM alpine:3.11

RUN	apk update && \
	apk upgrade && \
RUN apk add tar \
    git

RUN git clone https://github.com/frrouting/frr.git frr
## Directorio de Trabajo
#Establecer el directorio de trabajo en el direcotrio raiz /
WORKDIR ./

