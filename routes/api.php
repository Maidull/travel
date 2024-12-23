<?php

use App\Http\Controllers\Api\TripApiController;
use App\Http\Controllers\AuthController;
use App\Models\AppUser;
use App\Models\Destinations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\Trip;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Passport\Http\Controllers\AccessTokenController;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::post('/app/register', [AuthController::class, 'register']);
Route::post('/oauth/token', [AccessTokenController::class, 'issueToken']);

Route::post('/app/login', [AccessTokenController::class, 'issueToken'])->middleware('cors');
// Lấy danh sách trips
Route::get('/trip', function () {
    return Trip::all();
})->middleware('cors');


// //lay danh sach trip da dat 
// Route::get('/user-trip/{user_id}', function ($user_id) {
//     $userTrip = \App\Models\UsersTrip::where('user_id', $user_id)
//         ->with('trip')  
//         ->get();

//     return response()->json($userTrip);
// });


// //dat trip
// Route::post('/book-trip', function (Request $request) {
//     $validated = $request->validate([
//         'user_id' => 'required|exists:users,id', 
//         'trip_id' => 'required|exists:trip,id', 
//     ]);

//     $booking = \App\Models\UsersTrip::create([
//         'user_id' => $validated['user_id'],
//         'trip_id' => $validated['trip_id'],
//         'status' => 'booked',
//     ]);

//     return response()->json(['message' => 'Trip booked successfully', 'booking' => $booking], 201);
// });

// //huy trip 
// Route::post('/cancel-trip', function (Request $request) {
//     $validated = $request->validate([
//         'user_trip_id' => 'required|exists:users_trip,user_trip_id', 
//     ]);

//     $booking = \App\Models\UsersTrip::find($validated['user_trip_id']);
//     if ($booking->status !== 'booked') {
//         return response()->json(['message' => 'Cannot cancel a non-booked trip'], 400);
//     }

//     $booking->update(['status' => 'cancelled']);

//     return response()->json(['message' => 'trip cancelled successfully', 'booking' => $booking]);
// });
