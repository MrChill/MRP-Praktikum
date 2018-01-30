#! /usr/bin/env python

import pickle

pose1 = pickle.load(open('./pose1', 'r'))
pose2 = pickle.load(open('./pose2', 'r'))

print(pose1)
print(pose2)
