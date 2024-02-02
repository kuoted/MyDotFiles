# -*- coding: utf-8 -*-
import re
import os
import matplotlib.pyplot as plt
from enum import Enum, unique
import numpy as np


@unique
class NodeType(Enum):
    Lanelet2Map = "Lanelet2Map_Lanelet2Map"
    Lanelet2MapLoader = "Lanelet2MapLoader_Lanelet2Map"
    LanePlanner = "LanePlanner_Lanelet2MapLoader"
    ParkingPlanner = "ParkingPlanner_Lanelet2MapLoader"
    BehaviorPlannerLanePlanner = "BehaviorPlanner_LanePlanner"
    BehaviorPlannerParkingPlanner = "BehaviorPlanner_ParkingPlanner"
    MPCController = "MPCController_BehaviorPlanner"
    VehicleInterfaceBehaviorPlanner = "VehicleInterface_BehaviorPlanner"
    VehicleInterfaceMPCController = "VehicleInterface_MPCController"
    VehicleDBWSystem = "VehicleDBWSystem_VehicleInterface"


@unique
class DataProcessResultType(Enum):
    ScheduleSuccess = "schedule_success"
    DataError = "data_error"
    ScheduleError = "schedule_error"
    DataErrorLost = "data_error_lost"
    DataErrorDuplication = "data_error_duplication"

# 数据处理


def process_data(file_name, execute_count):
    try:
        f = open(file_name)
    except Exception as e:
        print("open file failed {} {}".format(file_name, e))
        return
    line = f.readline()

    # 存放分组数据
    data_groups = {}

    # 数据处理结果
    result_data = {}

    # 正确调度
    schedule_success = []

    # 记录错误数据
    data_error = {}
    schedule_error = []  # 错误调度
    data_error_lost = []   # 数据不完整，缺少
    data_error_duplication = []  # 数据重复
    data_error[DataProcessResultType.ScheduleError.value] = schedule_error
    data_error[DataProcessResultType.DataErrorLost.value] = data_error_lost
    data_error[DataProcessResultType.DataErrorDuplication.value] = data_error_duplication

    result_data[DataProcessResultType.ScheduleSuccess.value] = schedule_success
    result_data[DataProcessResultType.DataError.value] = data_error

    # 逐行处理数据
    while line:
        # 逐行处理数据
        line_data = line.split()

        # 行数据：分组id、节点名、 时间戳
        group_id = int(line_data[0])
        node_name = line_data[1]
        timestamp = int(''.join([c for c in line_data[2] if c.isdigit()]))

        # 判断数据是否已存在
        if group_id in data_groups:
            if group_id in data_error_duplication:           # 如果错误数据被记录，则直接跳过，处理下一行数据
                line = f.readline()
                continue
            elif node_name == NodeType.VehicleDBWSystem.value:  # 针对节点VehicleDBWSystem正常多次调用的情况，记录调用次数
                if node_name in data_groups[group_id]:
                    data_groups[group_id][node_name] += 1
                else:
                    data_groups[group_id][node_name] = 1
            elif node_name in data_groups[group_id]:    # 判断分组数据中的节点数据是否重复
                data_error_duplication.append(group_id)  # 记录重复的节点数据
                data_groups.pop(group_id)             # 剔除错误数据
                line = f.readline()
                continue
            else:
                data_groups[group_id][node_name] = timestamp
        else:
            node_data = {}
            node_data[node_name] = timestamp        # 首次记录分组数据
            data_groups[group_id] = node_data  # 添加到分组数据

        line = f.readline()

    f.close()

    analyse_data(execute_count, data_groups, result_data)

    return result_data


# 单组数据分析并统计
def analyse_data(execute_count, data_groups, result_data):
    # 根据执行次数循环处理处理分组数据
    for index in range(execute_count):
        # 如果第i次执行数据存在在错误数据中，则直接跳过后续处理，直接处理第n+1次数据
        if index in result_data[DataProcessResultType.DataError.value][DataProcessResultType.DataErrorDuplication.value]:
            continue
        elif (index not in data_groups) or check_node(data_groups[index]):
            result_data[DataProcessResultType.DataError.value][DataProcessResultType.DataErrorLost.value].append(
                index)  # 分组数据不存在或者数据不完整,记录到错误数据中
            continue
        else:
            if compare_time(data_groups[index]):  # 对比同一分组中的节点时间
                result_data[DataProcessResultType.ScheduleSuccess.value].append(
                    index)
            else:
                result_data[DataProcessResultType.DataError.value][DataProcessResultType.ScheduleError.value].append(
                    index)  # 记录调度错误的分组id


# 检查节点，查看分组数据中是否存在节点
def check_node(data):
    for node in NodeType:
        if node.value not in data:     # 判断节点是否被调用
            return True
    # 判断VehicleDBWSystem_VehicleInterface是否被调用了2次
    if data[NodeType.VehicleDBWSystem.value] != 2:
        return True
    return False


# 比较节点时间
def compare_time(data):
    if (data[NodeType.LanePlanner.value] > data[NodeType.ParkingPlanner.value]) and \
       (data[NodeType.MPCController.value] < data[NodeType.VehicleInterfaceBehaviorPlanner.value]):
        return True  # ParkingPlanner优先级高于LanePlanner，MPCController优先级高于VehicleInterface
    return False


# 画图
def draw(success_rate_list, failed_rate_list, executor_count, interval_time):

    ind = np.arange(len(success_rate_list))  # the x locations for the groups
    width = 0.35  # the width of the bars

    fig, ax = plt.subplots()
    rects1 = ax.bar(ind - width / 2, success_rate_list,
                    width, color='Green', label='Nomal')
    rects2 = ax.bar(ind + width / 2, failed_rate_list,
                    width, color='Red', label='Abnormal')

    # Add some text for labels, title and custom x-axis tick labels, etc.
    ax.set_ylabel('percentages(%)')
    title_name = '{} times datas'.format(executor_count)
    ax.set_title(title_name)
    ax.set_xticks(ind)
    ax.set_xticklabels(interval_time)
    ax.legend()

    def autolabel(rects, xpos='center'):
        xpos = xpos.lower()  # normalize the case of the parameter
        ha = {'center': 'center', 'center': 'center', 'center': 'center'}
        offset = {'center': 0.5, 'center': 0.5,
                  'center': 0.5}  # x_txt = x + w*off

        for rect in rects:
            height = rect.get_height()
            ax.text(rect.get_x() + rect.get_width() * offset[xpos], 0.5 * height,
                    '{}'.format(height), ha=ha[xpos], va='bottom')

    autolabel(rects1, "center")
    autolabel(rects2, "center")

    plt.show()


# 处理文件
def process_file(file_path):

    # 确定性调度成功率列表
    success_rate_list = []
    failed_rate_list = []

    # 获得执行次数
    count = file_path.split("\\")[-1]
    count_conver = {"1w": 10000, "5w": 50000, "10w": 100000}
    executor_count = count_conver[count]

    # 发送时间列表
    interval_time = []

    # 获得当前目录下的文件
    file_dict = {}

    for root, dirs, files in os.walk(file_path):
        for file_name in files:
            r = re.search(
                'data_[0-9]+ms_{}_processing.log'.format(count), file_name)
            if r:
                path = os.path.join(root, file_name)
                num = int(file_name.split("_")[1].split("ms")[0])
                file_dict[num] = path
                # print(path)

    file_list = sorted(file_dict.items(), key=lambda x: x[0])

    for file in file_list:
        interval_time.append("{}ms".format(file[0]))
        result_data = process_data(file[1], executor_count)

        success_count = len(
            result_data[DataProcessResultType.ScheduleSuccess.value])
        schedule_error_count = len(
            result_data[DataProcessResultType.DataError.value][DataProcessResultType.ScheduleError.value])
        data_error_duplication_count = len(
            result_data[DataProcessResultType.DataError.value][DataProcessResultType.DataErrorDuplication.value])
        data_error_lost_count = len(
            result_data[DataProcessResultType.DataError.value][DataProcessResultType.DataErrorLost.value])

        print("file_path: {}"
              "\nschedule_success_count: {} "
              "\nschedule_error_count: {} "
              "\ndata_error_duplication_count: {} "
              "\ndata_error_lost_count: {} "
              "\nschedule_success: {}"
              "\nschedule_error: {}  "
              "\ndata_error_duplication: {}"
              "\ndata_error_lost: {} \n\n\n".format(
                  file[1],
                  success_count,
                  schedule_error_count,
                  data_error_duplication_count,
                  data_error_lost_count,
                  result_data[DataProcessResultType.ScheduleSuccess.value],
                  result_data[DataProcessResultType.DataError.value][DataProcessResultType.ScheduleError.value],
                  result_data[DataProcessResultType.DataError.value][DataProcessResultType.DataErrorDuplication.value],
                  result_data[DataProcessResultType.DataError.value][DataProcessResultType.DataErrorLost.value]))

        # 确定性调度成功率
        success_rate = round(success_count / executor_count * 100, 2)
        failed_rate = round(100 - success_rate, 2)

        success_rate_list.append(success_rate)
        failed_rate_list.append(failed_rate)

    # 画图
    draw(success_rate_list, failed_rate_list, executor_count, interval_time)


if __name__ == "__main__":
    process_file(
        r"D:\Project\Pycharm\framework_test\tools\draw\data\master\processing\10w")
