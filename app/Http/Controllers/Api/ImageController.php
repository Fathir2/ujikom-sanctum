<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ImageResource;
use App\Models\Image;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;


class ImageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $img = Image::all();
        return ImageResource::collection($img);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validasi input
        $validated = $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'title_image' => 'required|string|max:255',
            'description' => 'nullable|string',
            'gallery_id' => 'required|exists:galleries,id'
        ]);

        // Simpan gambar ke storage dan dapatkan path-nya
        $path = $request->file('image')->store('images', 'public');
        $validated['image'] = $path;

        // Simpan data gambar ke database
        $img = $request->user()->image()->create($validated);

        return new ImageResource($img);
    }

    /**
     * Display the specified resource.
     */
    public function show(Image $img)
    {
        return new ImageResource($img);
    }

    
    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $img = Image::find($id);
    
        if (!$img) {
            return response()->json(['message' => 'Gambar tidak ditemukan'], 404);
        }
    
        Log::info("Data gambar yang akan dihapus:", ['id' => $img->id, 'image' => $img->image]);
    
        // Hapus gambar dari storage jika ada
        if ($img->image && Storage::disk('public')->exists($img->image)) {
            Storage::disk('public')->delete($img->image);
        }
    
        // Hapus data gambar dari database
        $img->delete();
    
        Log::info("Gambar dengan ID: {$img->id} berhasil dihapus dari database");
    
        return response()->json([
            'message' => 'Gambar berhasil dihapus',
        ], 200);
    }
    
    
    
}
