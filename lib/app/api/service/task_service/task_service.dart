import 'package:task_tracker/app/api/api_client/api_response.dart';
import 'package:task_tracker/app/api/data/response/model/task/task_model.dart';
import 'package:task_tracker/app/base/base_service.dart';
import 'package:task_tracker/app/common/api_end_point/api_end_point.dart';

abstract class TaskServiceInterface {
  addTask(TaskModel taskModel);
  getAllTask();
  getTaskById(String? id);
  deleteTaskById(String? id);
  updateTaskById({String? id, TaskModel? taskModel});
  getTaskByCompleted();
  getTaskByPagination({int? limit, int? skip});
}

class TaskService extends BaseApiService implements TaskServiceInterface {
  @override
  addTask(TaskModel taskModel) async {
    ApiResponse apiResponse = await dioClient.post(
        endpoint: ApiEndPoint.task, data: taskModel.toJson());
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
  updateTaskById({String? id, TaskModel? taskModel}) async {
    ApiResponse apiResponse = await dioClient.put(
        endpoint: "${ApiEndPoint.task}/$id", data: taskModel?.toJson());
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
  getAllTask() async {
    ApiResponse apiResponse = await dioClient.get(endpoint: ApiEndPoint.task);
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
  getTaskById(String? id) async {
    ApiResponse apiResponse =
        await dioClient.get(endpoint: '${ApiEndPoint.task}/$id');
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
  deleteTaskById(String? id) async {
    ApiResponse apiResponse =
        await dioClient.delete(endpoint: '${ApiEndPoint.task}/$id');
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
}
