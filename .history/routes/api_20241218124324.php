<?php

use App\Models\Destinations;
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

//Lay danh sach dia diem
Route::get('/destinations', function () {
    return Destinations::all(); 
});

//lay danh sach tour da dat 
Route::get('/user-tours/{user_id}', function ($user_id) {
    $userTours = \App\Models\UsersTour::where('user_id', $user_id)
        ->with('tour') // Kèm thông tin tour
        ->get();

    return response()->json($userTours);
});


//dat trip
Route::post('/book-tour', function (Request $request) {
    $validated = $request->validate([
        'user_id' => 'required|exists:users,id', // ID của user
        'trip_id' => 'required|exists:trip,id', // ID của tour
    ]);

    $booking = \App\Models\UsersTour::create([
        'user_id' => $validated['user_id'],
        'trip_id' => $validated['trip_id'],
        'status' => 'booked',
    ]);

    return response()->json(['message' => 'Trip booked successfully', 'booking' => $booking], 201);
});

//huy trip 
Route::post('/cancel-tour', function (Request $request) {
    $validated = $request->validate([
        'user_tour_id' => 'required|exists:users_tour,user_tour_id', // ID của booking
    ]);

    $booking = \App\Models\UsersTour::find($validated['user_tour_id']);
    if ($booking->status !== 'booked') {
        return response()->json(['message' => 'Cannot cancel a non-booked tour'], 400);
    }

    $booking->update(['status' => 'cancelled']);

    return response()->json(['message' => 'Tour cancelled successfully', 'booking' => $booking]);
});
