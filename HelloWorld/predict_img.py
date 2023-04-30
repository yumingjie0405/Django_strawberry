import torch
import numpy as np


def your_yolov5_model(image):
    # 加载模型
    model = torch.hub.load('ultralytics/yolov5', 'custom', path='yolov5s.pt')

    # 图像预处理
    img = image.transpose(2, 0, 1)  # HWC -> CHW
    img = np.expand_dims(img, axis=0)  # 增加批次维度
    img = img / 255.0  # 归一化

    # 推理
    results = model(torch.from_numpy(img), size=640)

    # 提取预测结果
    pred = results.xyxy[0].cpu().numpy()
    confidence = pred[:, 4].tolist()
    class_id = pred[:, 5].tolist()
    bbox = pred[:, :4].tolist()

    # 构建返回结果
    return {
        'confidence': confidence,
        'class': class_id,
        'bbox': bbox
    }
