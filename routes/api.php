<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\InfoController;
use App\Http\Controllers\Api\KategoriController;
use App\Http\Controllers\Api\AgendaController;
use App\Http\Controllers\Api\GalleryController;
use App\Http\Controllers\Api\ImageController;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware([EnsureFrontendRequestsAreStateful::class, 'auth:sanctum'])->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    
    // Resource routes for info, agenda, and foto
    Route::apiResource('info', InfoController::class); 
    Route::resource('/agenda', \App\Http\Controllers\Api\AgendaController::class);
    Route::resource('/gallery', \App\Http\Controllers\Api\GalleryController::class);
    Route::resource('/image', \App\Http\Controllers\Api\ImageController::class);
    Route::resource('/cathegory', \App\Http\Controllers\Api\KategoriController::class);
    
   
    
});
