<?php

use App\Models\Destinations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Trip;
use Illuminate\Support\Facades\Auth;

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
Route::post('/app/register', function (Request $request) {
    $validated = $request->validate([
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:app_user,email',
        'password' => 'required|string|min:8',
    ]);

    $user = AppUser::create([
        'name' => $validated['name'],
        'email' => $validated['email'],
        'password' => Hash::make($validated['password']),
    ]);

    return response()->json(['message' => 'User registered successfully', 'user' => $user], 201);
});

// Lấy danh sách trips
Route::get('/trip', function () {
    return Trip::all();
});

//Lay danh sach dia diem
Route::get('/destinations', function () {
    return Destinations::all(); 
});

//lay danh sach trip da dat 
Route::get('/user-trip/{user_id}', function ($user_id) {
    $userTrip = \App\Models\UsersTrip::where('user_id', $user_id)
        ->with('trip')  
        ->get();

    return response()->json($userTrip);
});


//dat trip
Route::post('/book-trip', function (Request $request) {
    $validated = $request->validate([
        'user_id' => 'required|exists:users,id', 
        'trip_id' => 'required|exists:trip,id', 
    ]);

    $booking = \App\Models\UsersTrip::create([
        'user_id' => $validated['user_id'],
        'trip_id' => $validated['trip_id'],
        'status' => 'booked',
    ]);

    return response()->json(['message' => 'Trip booked successfully', 'booking' => $booking], 201);
});

//huy trip 
Route::post('/cancel-trip', function (Request $request) {
    $validated = $request->validate([
        'user_trip_id' => 'required|exists:users_trip,user_trip_id', 
    ]);

    $booking = \App\Models\UsersTrip::find($validated['user_trip_id']);
    if ($booking->status !== 'booked') {
        return response()->json(['message' => 'Cannot cancel a non-booked trip'], 400);
    }

    $booking->update(['status' => 'cancelled']);

    return response()->json(['message' => 'trip cancelled successfully', 'booking' => $booking]);
});
