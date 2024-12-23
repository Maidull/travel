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

//
Route::get('/destinations', function () {
    return Destinations::all(); 
});


Route::post('/book-tour', function (Request $request) {
    $validated = $request->validate([
        'user_id' => 'required|exists:users,id', // ID của user
        'tour_id' => 'required|exists:tours,id', // ID của tour
    ]);

    $booking = \App\Models\UsersTour::create([
        'user_id' => $validated['user_id'],
        'tour_id' => $validated['tour_id'],
        'status' => 'booked',
    ]);

    return response()->json(['message' => 'Tour booked successfully', 'booking' => $booking], 201);
});

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
