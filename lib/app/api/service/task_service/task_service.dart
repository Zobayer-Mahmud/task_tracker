import 'package:task_tracker/app/api/api_client/api_response.dart';
import 'package:task_tracker/app/api/data/response/model/task/all_task_model.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/base/base_service.dart';
import 'package:task_tracker/app/common/api_end_point/api_end_point.dart';

abstract class TaskServiceInterface {
  Future<bool> addTask(TaskModel taskModel);
  Future<AllTaskModel?> getAllTask();
  Future<TaskModel?> getTaskById(String? id);
  Future<bool> deleteTaskById(String? id);
  Future<bool> updateTaskById({String? id, TaskModel? taskModel});
  getTaskByCompleted();
  getTaskByPagination({int? limit, int? skip});
}

class TaskService extends BaseApiService implements TaskServiceInterface {
  @override
  Future<bool> addTask(TaskModel taskModel) async {
    ApiResponse apiResponse = await dioClient.post(
        endpoint: ApiEndPoint.task, data: taskModel.toJson());
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType addTask");
        return true;
        // return apiResponse.response?.data['image'];
      } else {
        return false;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return false;
    }
  }

  @override
  Future<bool> updateTaskById({String? id, TaskModel? taskModel}) async {
    ApiResponse apiResponse = await dioClient.put(
        endpoint: "${ApiEndPoint.task}/$id", data: taskModel?.toJson());
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType addTask");
        return true;
        // return apiResponse.response?.data['image'];
      } else {
        return false;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return false;
    }
  }

  @override
  Future<AllTaskModel?> getAllTask() async {
    ApiResponse apiResponse = await dioClient.get(endpoint: ApiEndPoint.task);
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        return AllTaskModel.fromJson(apiResponse.response?.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  getTaskByCompleted() async {
    ApiResponse apiResponse = await dioClient
        .get(endpoint: ApiEndPoint.task, queryParams: {"completed": true});
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType addTask");
        // return apiResponse.response?.data['image'];
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  getTaskByPagination({int? limit, int? skip}) async {
    ApiResponse apiResponse = await dioClient.get(
        endpoint: ApiEndPoint.task,
        queryParams: {"limit": limit, 'skip': skip});
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType addTask");
        // return apiResponse.response?.data['image'];
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  Future<TaskModel?> getTaskById(String? id) async {
    ApiResponse apiResponse =
        await dioClient.get(endpoint: '${ApiEndPoint.task}/$id');
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType getTaskById");
        return TaskModel.fromJson(apiResponse.response?.data['data']);
      } else {
        return null;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return null;
    }
  }

  @override
  Future<bool> deleteTaskById(String? id) async {
    ApiResponse apiResponse =
        await dioClient.delete(endpoint: '${ApiEndPoint.task}/$id');
    try {
      if (apiResponse.success && apiResponse.response?.data != null) {
        print("${apiResponse.response?.data} $runtimeType addTask");
        return true;
        // return apiResponse.response?.data['image'];
      } else {
        return false;
      }
    } catch (e) {
      print("Api error $e $runtimeType");
      return false;
    }
  }
}
