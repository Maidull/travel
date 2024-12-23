<?php

namespace App\Http\Controllers;

use App\Models\AppUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class AuthController extends Controller
{
    // Đăng ký
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:app_user,email',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        $user = AppUser::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        return response()->json(['message' => 'User registered successfully', 'user' => $user], 201);
    }

    // Đăng nhập
    public function login(Request $request)
    {
        // Validate the input
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:8',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        // Check if user exists and validate password
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            // Lấy người dùng hiện tại
            $user = Auth::user();

            // Ở đây bạn sẽ không tạo token mới mà chỉ trả về access_token đã có từ trước.
            // Chỉ cần trả về thông tin người dùng và access_token mà ứng dụng React Native đã lấy từ /oauth/token

            return response()->json([
                'message' => 'Login successful',
                'user' => $user, // Trả về thông tin người dùng
                'token' => $request->bearerToken() // Trả về token mà bạn đã có
            ], 200);
        }

        // Nếu đăng nhập thất bại
        Log::warning('Unauthorized login attempt', [
            'email' => $request->email
        ]);
        return response()->json(['error' => 'Unauthorized'], 401);
    }
}
