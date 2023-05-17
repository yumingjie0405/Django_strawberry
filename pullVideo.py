import asyncio
import websockets
import cv2
import numpy as np
import base64

from ultralytics import YOLO

# detector = dlib.get_frontal_face_detector()
model = YOLO('../media/model/best.pt')
capture = cv2.VideoCapture(0)  # 使用摄像头进行实时检测
encode_param = [int(cv2.IMWRITE_JPEG_QUALITY), 95]


# 开始推流视频
async def pullVideo(websocket):
    while True:
        ret, frame = capture.read()
        if not ret:
            break
        detections = model(frame,conf=0.6)
        annotated_frame = detections[0].plot()
        _, imgencode = cv2.imencode('.jpeg', annotated_frame, encode_param)
        data = np.array(imgencode)
        img = data.tobytes()
        # base64编码传输
        img = base64.b64encode(img).decode()
        await websocket.send("data:image/jpeg;base64," + img)


async def main_logic():
    async with websockets.connect('ws://127.0.0.1:8000/ws/video/wms/', ping_interval=None) as websocket:
        await pullVideo(websocket)


asyncio.get_event_loop().run_until_complete(main_logic())
