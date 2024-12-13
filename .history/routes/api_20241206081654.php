<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Admin\TripCrudController;
use App\Http\Controllers\Admin\DestinationsCrudController;

Route::group([
    'prefix' => 'admin',
    'middleware' => ['api'], // Sử dụng middleware API
    'namespace' => 'App\Http\Controllers\Admin',
], function () {
    // Các route CRUD cho app React Native
    Route::get('trip', [TripCrudController::class, 'index']); // Lấy danh sách trips
    Route::post('trip', [TripCrudController::class, 'store']); // Tạo trip
    Route::get('trip/{id}', [TripCrudController::class, 'show']); // Chi tiết trip
    Route::put('trip/{id}', [TripCrudController::class, 'update']); // Cập nhật trip
    Route::delete('trip/{id}', [TripCrudController::class, 'destroy']); // Xóa trip

    Route::get('destinations', [DestinationsCrudController::class, 'index']); // Lấy danh sách destinations
    Route::post('destinations', [DestinationsCrudController::class, 'store']); // Tạo destination
    Route::get('destinations/{id}', [DestinationsCrudController::class, 'show']); // Chi tiết destination
    Route::put('destinations/{id}', [DestinationsCrudController::class, 'update']); // Cập nhật destination
    Route::delete('destinations/{id}', [DestinationsCrudController::class, 'destroy']); // Xóa destination
});


// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
