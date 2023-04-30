import os
import random
import matplotlib.pyplot as plt

# 定义函数，用于读取指定文件夹中的所有图片文件
def load_images_from_folder(folder):
    images = []
    for filename in os.listdir(folder):
        if filename.endswith('.jpg') or filename.endswith('.png'):
            img_path = os.path.join(folder, filename)
            img = plt.imread(img_path)
            images.append(img)
    return images

# 定义要读取的文件夹路径
folder_path = '../doc'

# 调用函数读取文件夹中的所有图片文件
images = load_images_from_folder(folder_path)

# 随机选取八张图片
random.shuffle(images)
selected_images = images[:8]

# 创建一个2x4的画布，用于显示八张图片
fig, axes = plt.subplots(nrows=2, ncols=4)

# 在画布中显示八张图片
for i, ax in enumerate(axes.flatten()):
    ax.imshow(selected_images[i])
    ax.axis('off')
plt.savefig(folder_path)
plt.show()

