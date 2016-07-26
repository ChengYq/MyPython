# -*- coding: utf-8 -*-
import os
import re
import numpy as np


def calPath(path1, path2):
    # 函数功能：将文件夹内的文件路径读出来
    # 输入，han和spam的文件夹路径
    # 输出，两个LIst，分别记录了ham和spam两个文件夹下文件的路径
    all_file_path1 = []
    all_file_path2 = []
    file_stats = os.walk(path1)
    for f in file_stats:
        for i in f[2]:
            one_file_path1 = f[0] + os.sep + i
            all_file_path1.append(one_file_path1)
    file_stats = os.walk(path2)
    for f in file_stats:
        for i in f[2]:
            one_file_path2 = f[0] + os.sep + i
            all_file_path2.append(one_file_path2)
    return all_file_path1, all_file_path2


def loadData(path1):
    # 函数功能：读取处理之后的文件内容
    # 输入： 文件的路径
    # 输出：经过处理的文件内容。一个文件用一个list来表示，list的内容，就是分割过后的内容
    content1 = []
    f = open(path1)
    MyStr = f.readlines()  # 这个函数，一个文件一个list,list中的元素的个数，是这个文件的行数
    res = re.split(r'\W+', "".join(MyStr))  # 将list切分，结果仍然是一个List , 但是元素的个数变多了
    for i in res:
        if len(i) <= 2:
            res.remove(i)
    content1.append(res)
    return content1


def createWordDict(content1, content2):
    # 函数功能：创建词库，作为向量
    # 输入：ham和spam的内容list
    # 输出：ham和spam组建成的词库，去掉了所有的重复项
    content1list = []
    content2list = []
    for i in content1:
        content1list.append(i)
    for i in content2:
        content2list.append(i)
    content1_str=str(content1list)
    content2_str=str(content2list)
    WordDict = set(content1_str).union(set(content2_str))
    return WordDict


def createWordVec(WordDict, toClassify):
    # 函数功能：将文字向量转换为数字响亮，出现了就是1，没出现就是0
    # 输入: 词库，要转换为数字向量的内容（用一个list形式给出）
    # 输出： 数字向量
    wordVec = [0] * len(toClassify)
    for ii in toClassify:
        if ii in WordDict:
            wordVec[toClassify.index(ii)] = 1
    return wordVec


def bayesClassifier():
    # 函数功能： 运行朴素贝叶斯算法
    #
    #
    path_ham = "C:\documents\Python\Prog\exercise7\email\ham"
    path_spam = "C:\documents\Python\Prog\exercise7\email\spam"
    all_path_ham, all_path_spam = calPath(path_ham, path_spam)
    # 以下代码段，将文件放进一个多行的list中，行数就等于这个分类的文件的个数
    content_ham = []
    content_spam = []
    wordVec_ham = []
    wordVec_spam = []
    for file_path in all_path_ham:
        content_ham.append(loadData(file_path))
    for file_path in all_path_spam:
        content_spam.append(loadData(file_path))
    # 以下代码段，是将多个文件的内容，转换为一组数字向量
    WordDict = createWordDict(content_ham, content_spam)
    for ii in content_ham:
        wordVec_ham.append(createWordVec(WordDict, ii))
    for jj in content_spam:
        wordVec_spam.append(createWordVec(WordDict, jj))
    return wordVec_ham,wordVec_spam


a,b=bayesClassifier()
print a,b