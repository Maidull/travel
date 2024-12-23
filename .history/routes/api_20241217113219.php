<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/trips', function () {
    return \App\Models\Trip::all(); // Lấy tất cả các trips
});
Route::post('/trips', [\App\Http\Controllers\Api\TripController::class, 'store']); // Tạo trip mới
Route::put('/trips/{id}', [\App\Http\Controllers\Api\TripController::class, 'update']); // Cập nhật trip
Route::delete('/trips/{id}', [\App\Http\Controllers\Api\TripController::class, 'destroy']); // Xóa trip
// Route::apiResource('trips', \App\Http\Controllers\Api\TripController::class);
