# -*- coding: utf-8 -*-
import os
import sys

reload(sys)
sys.setdefaultencoding('utf-8')


def getEcMap():
    ecMap = []
    ecMap.append({'idx': 'A', 'column': '', 'xml': 'id'})
    ecMap.append({'idx': 'B', 'column': '', 'xml': 'type'})
    ecMap.append({'idx': 'C', 'column': '', 'xml': 'params'})
    return ecMap
    pass


def main():
    print getEcMap
    pass


if __name__ == '__main__':
    main()