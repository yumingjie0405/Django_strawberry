import cv2
from ultralytics import YOLO


def your_yolov5_model(image):
    # 加载模型
    # model = torch.hub.load('ultralytics/yolov5', 'custom', path='yolov5s.pt')
    model = YOLO('../media/model/train16/weights/best.pt')
    # model = YOLO('../media/model/best.pt')
    results = model(image)
    boxes = results[0].boxes
    bbox = boxes.xywh.tolist()
    confidence = boxes.conf.tolist()  # confidence score, (N, 1)
    class_id = boxes.cls.tolist()  # cls, (N, 1)
    res_plotted = results[0].plot()
    print(type(res_plotted))
    # cv2.imshow("result", res_plotted)
    # cv2.waitKey(0)
    # print('预测的类别：', class_id)
    # print('预测的置信度{}'.format(confidence))
    # print('预测的bbox',bbox)
    # 构建返回结果
    return {
        'confidence': confidence,
        'class': class_id,
        'bbox': bbox,
        'img':res_plotted

    }


if __name__ == '__main__':
    img_dir = '../doc/5.jpg'
    result = your_yolov5_model(img_dir)
    print(result)
