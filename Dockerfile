FROM python:3.8-slim 
RUN apt-get update 
RUN mkdir /src 
COPY ./src /src 
WORKDIR /src  
RUN pip install -r /src/requirements.txt 
RUN pip install requests

CMD ["python", "track.py", "--source 0", "--yolo_weights yolov5s.pt" , "--show-vid" ,"--img 640"]
