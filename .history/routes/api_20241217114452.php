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


// Lấy danh sách trips
Route::get('/trips', function () {
    return Trip::all();
});

// Tạo trip mới
Route::post('/trips', function (Request $request) {
    $validated = $request->validate([
        'name' => 'required',
        'price' => 'required|numeric',
        'start_date' => 'required|date',
        'end_date' => 'required|date',
    ]);
    return Trip::create($validated);
});

// Cập nhật trip
Route::put('/trips/{id}', function (Request $request, $id) {
    $trip = Trip::findOrFail($id);
    $validated = $request->validate([
        'name' => 'required',
        'price' => 'required|numeric',
        'start_date' => 'required|date',
        'end_date' => 'required|date',
    ]);
    $trip->update($validated);
    return $trip;
});

// Xóa trip
Route::delete('/trips/{id}', function ($id) {
    $trip = Trip::findOrFail($id);
    $trip->delete();
    return response()->json(['message' => 'Deleted successfully']);
});

