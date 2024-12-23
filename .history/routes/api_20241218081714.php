<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Trip;
use App\Model\Destinations;

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

Route::get('/destinations', function () {
    return Destinationss::all(); // Lấy tất cả các destinations
});

Route::get('/destinations/{id}', function ($id) {
    $destination = Destinations::find($id);

    if (!$destination) {
        return response()->json(['message' => 'Destination not found'], 404);
    }

    return $destination; // Trả về thông tin chi tiết của destination
});