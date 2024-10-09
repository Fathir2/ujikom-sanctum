<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\GalleryResource;
use App\Models\Gallery;
use Illuminate\Http\Request;

class GalleryController extends Controller
{
    // Menampilkan semua galeri
    public function index()
    {
        $galeri = Gallery::all();
        return GalleryResource::collection($galeri);
    }

    // Menyimpan galeri baru
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title_album' => 'required|string|max:255',
            'due_date' => 'required|date',
        ]);

        // Pastikan relasi 'galeri' ada di User model
        $galeri = $request->user()->galeri()->create($validated);

        return new GalleryResource($galeri);
    }

    // Menampilkan detail galeri
    public function show(Gallery $gallery)
    {
        return new GalleryResource($gallery);
    }

    // Mengupdate galeri yang ada
    public function update(Request $request, Gallery $gallery)
    {
        $validated = $request->validate([
            'title_album' => 'required|string|max:255',
            'due_date' => 'required|date',
        ]);

        $gallery->update($validated);

        return new GalleryResource($gallery);
    }

    // Menghapus galeri
    public function destroy(Gallery $gallery)
    {
        $gallery->delete();

        return response()->json(null, 204);
    }
}
