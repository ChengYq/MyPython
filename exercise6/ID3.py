# -*- coding: utf-8 -*-
# 本题目给我的启示：
# 1.功能分解，这是计算香农熵的时候遇到的问题。把计算香农熵，分解成shannonH 和 splitData两个函数
# 2.模块化编程 这个恐怕是早就应该掌握的思想了模块化编程，有利于代码的重用，特别是后边的递归式，完全要依靠模块化编程
# 3. 递归式很重要啊~
import numpy as np
import matplotlib.pyplot as plt


def shannonH(dataSet):
    # 本函数的功能：计算香农熵。输入：dataSet，输出香农熵。
    # 需要注意的是，这里计算香农熵，只和dataSet的最后一列的数据有关
    label_count = {}
    total_num = dataSet.shape[0]
    for fea in dataSet[:, -1]:
        if fea not in label_count.keys():
            label_count[fea] = 0
        label_count[fea] += 1
    shannon = 0
    for (k, v) in label_count.items():
        p = float(v) / float((total_num))
        shannon = shannon - p * np.log2(p)
    return shannon


def splitData(dataSet, col_ind, feature_value):
    # 这个函数的功能，是把dataSet进行分割（筛选）。输入dataSet,列索引值，以及该列需要按照哪个feature进行分割
    # 输出，已经筛选完毕的dataSet
    splited = [ele for ele in dataSet if ele[col_ind] == feature_value]
    return np.array(splited)


def best_feature(dataSet):
    # 这个函数的功能，就是计算出当下这个dataSet，应该按照哪个特征（哪一列）进行分割使得熵减少最大
    # 输出：feature的列的索引（下标）
    feature_list = []
    theSum = []
    for i in range(data.shape[1] - 1):
        ratio = []
        for item in list(set(dataSet[:, i])):
            feature_list.append(item)
            res = splitData(dataSet, i, item)
            feature_count = len(res[:, 0])
            ratio.append((shannonH(data) - shannonH(res)) * float(feature_count) / float(data.shape[0]))
        theSum.append((np.array(ratio)).sum())
        seq = np.argsort(map(lambda x: x * (-1), theSum))  # 为了从大到小排列，不得不用map函数把所有的数字取相反数，然后在调用argsort()函数
    return seq[0]


def create_tree(dataSet):
    # 功能：创建决策树
    # 利用字典进行存储，使用的是递归的方法
    # 输出：最终决策树的字典表示
    if len(set(dataSet[:, -1])) == 1:
        return set(dataSet[:, -1]).pop()
    # if len(dataSet[0]) == 1:
    #     return set(dataSet[:, -1]).pop()
    best_feature_index = best_feature(dataSet)
    Mytree = {best_feature_index: {}}  # 这个定义方式很叼
    unique = set(dataSet[:, best_feature_index])
    for ele in unique:
        Mytree[best_feature_index][ele] = create_tree(splitData(dataSet, best_feature_index, ele))
    return Mytree


data = np.loadtxt('C:\\documents\\Python\\Prog\\exercise6\\lenses.txt', delimiter="	", dtype=str)
print create_tree(data)
