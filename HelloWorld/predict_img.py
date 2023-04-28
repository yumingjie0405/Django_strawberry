import os
import cv2
import numpy as np
from keras.models import load_model
from matplotlib import pyplot as plt

from django_Crop import settings

ROWS = 150
COLS = 150
CHANNELS = 3


def read_image(file_path):
    img = cv2.imread(file_path, cv2.IMREAD_COLOR)
    return cv2.resize(img, (ROWS, COLS), interpolation=cv2.INTER_CUBIC)


def predict():
    media_path = os.path.join(settings.MEDIA_ROOT)
    result = []
    media_img = os.path.join(settings.MEDIA_ROOT, "img/")
    media_model = load_model(os.path.join(media_path, "model/cats_and_dogs_small_4.h5"))
    print(media_model)
    test_images = [os.path.join(media_img + i) for i in os.listdir(media_img)]
    count = len(test_images)
    data = np.ndarray((count, ROWS, COLS, CHANNELS), dtype=np.uint8)
    print("图片网维度：", data.shape)
    for i, image_file in enumerate(test_images):
        print(image_file)
        image = read_image(image_file)
        # print()
        data[i] = image
        # data[i] = image.T
        if i % 250 == 0: print('处理 {} of {}'.format(i + 1, count))
    test = data
    predictions = media_model.predict(test, verbose=0)
    dict = {}
    urls = []
    for i in test_images:
        # 将路径拆分为目录和文件名
        directory, filename = os.path.split(i)
        # 将目录转换为标准化的路径并拆分为列表
        directory_list = os.path.normpath(directory).split(os.sep)
        directory_list.append(filename)
        print(directory_list)
        print(directory_list)
        url = '/' + directory_list[2] + '/' + directory_list[3] + '/' + directory_list[4]
        urls.append(url)
    for i in range(0, len(predictions)):
        if predictions[i, 0] >= 0.5:
            print('I am {:.2%} sure this is a Dog'.format(predictions[i][0]))
            dict[urls[i]] = "图片有{}%的可能预测为：Dog ！".format(int(predictions[i][0] * 100))
        else:
            print('I am {:.2%} sure this is a Cat'.format(1 - predictions[i][0]))
            dict[urls[i]] = "图片有{}%的可能预测为：cat ！".format(int((1 - predictions[i][0]) * 100))
        # plt.imshow(test[i])
        # plt.show()
    return dict


if __name__ == '__main__':
    result = predict()
    for i in result:
        print(i)
