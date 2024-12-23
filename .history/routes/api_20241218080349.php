<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Trip;

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
Route::get('/trip', function () {
    return Trip::all();
});

// Tạo trip mới
Route::post('/trip', function (Request $request) {
    $validated = $request->validate([
        'name' => 'required',
        'description' => 'required',
        'duration' =>'required'
        'price' => 'required|numeric',
        'start_date' => 'required|date',
        'end_date' => 'required|date',
    ]);
    return Trip::create($validated);
});

// Cập nhật trip
Route::put('/trip/{id}', function (Request $request, $id) {
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
Route::delete('/trip/{id}', function ($id) {
    $trip = Trip::findOrFail($id);
    $trip->delete();
    return response()->json(['message' => 'Deleted successfully']);
});

