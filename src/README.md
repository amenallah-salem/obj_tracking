# Yolov5 + Deep Sort with PyTorch





<div align="center">
<p>
<img src="MOT16_eval/track_pedestrians.gif" width="400"/> <img src="MOT16_eval/track_all.gif" width="400"/> 
</p>
<br>
<div>
 
</div>

</div>





## Before you run the tracker

`pip install -r requirements.txt`


## Tracking sources

Tracking can be run on most video formats

```bash
python3 track.py --source ... --show-vid  # show live inference results as well
```

- Video:  `--source file.mp4`
- Webcam:  `--source 0`
- RTSP stream:  `--source rtsp://170.93.143.139/rtplive/470011e600ef003a004ee33696235daa`


## Select a Yolov5 family model

There is a clear trade-off between model inference speed and accuracy. In order to make it possible to fulfill your inference speed/accuracy needs
you can select a Yolov5 family model for automatic download

```bash


$ python track.py --source 0 --yolo_weights yolov5s.pt --img 640
                                            yolov5m.pt
                                            yolov5l.pt 
                                            yolov5x.pt --img 1280
```

## Filter tracked classes

By default the tracker tracks all MS COCO classes.

If you only want to track persons I recommend you to get [these weights](https://drive.google.com/file/d/1gglIwqxaH2iTvy6lZlXuAcMpd_U0GCUb/view?usp=sharing) for increased performance

```bash
python3 track.py --source 0 --yolo_weights yolov5/weights/crowdhuman_yolov5m.pt --classes 0  # tracks persons, only
```

If you want to track a subset of the MS COCO classes, add their corresponding index after the classes flag

```bash
python3 track.py --source 0 --yolo_weights yolov5s.pt --classes 16 17  # tracks cats and dogs, only
```

[Here](https://tech.amikelive.com/node-718/what-object-categories-labels-are-in-coco-dataset/) is a list of all the possible objects that a Yolov5 model trained on MS COCO can detect. Notice that the indexing for the classes in this repo starts at zero.


## MOT compliant results

Can be saved to `inference/output` by 

```bash
python3 track.py --source ... --save-txt
```


