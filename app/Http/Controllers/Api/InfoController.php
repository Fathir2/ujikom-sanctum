<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Information;
use App\Http\Resources\InfoResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;


class InfoController extends Controller
{
    public function index()
    {
        $info = Information::all();
        return InfoResource::collection($info);
    }

    public function store(Request $request)
    {
        // Validasi input
        $validated = $request->validate([
            'picture' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'date' => 'required|date'
        ]);

        // Simpan gambar ke storage dan dapatkan path-nya
        $path = $request->file('picture')->store('pictures', 'public');
        $validated['picture'] = $path;

        // Simpan data gambar ke database
        $info = $request->user()->information()->create($validated);

        return new InfoResource($info);
    }


  
    public function show(Information $info)
    {
        // data yang ditampilkan
        return new InfoResource($info);
    }


   
    public function update(Request $request, Information $info)
    {
        try {
            // Debug untuk melihat data yang diterima
            Log::info('Request data:', $request->all());

            // Validasi input
            $validated = $request->validate([
                'title' => 'required|string|max:255',
                'picture' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
                'description' => 'nullable|string',
                'date' => 'required|date_format:Y-m-d'
            ]);
        
            // Jika ada gambar baru, lakukan pembaruan gambar
            if ($request->hasFile('picture')) {
                // Hapus gambar lama jika ada
                if ($info->picture && Storage::disk('public')->exists($info->picture)) {
                    Storage::disk('public')->delete($info->picture);
                }
        
                // Simpan gambar baru
                $path = $request->file('picture')->store('pictures', 'public');
                $validated['picture'] = $path;
            } elseif ($info->picture) {
                // Jika tidak ada gambar baru, pertahankan gambar lama
                $validated['picture'] = $info->picture;
            }
        
            // Update data informasi
            $info->update($validated);
        
            //debug pesan jika data berhasil diperbarui
            return response()->json([
                'message' => 'Informasi berhasil diperbarui',
                'data' => $info
            ], 200);

            
         //debug pesan jika validasi gagal
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'message' => 'Validasi gagal',
                'errors' => $e->errors(),
                'received_data' => $request->all() // Tambahkan ini untuk debugging
            ], 422); 
            //debug pesan jika terjadi kesalahan
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    

    public function destroy($id)
    {
        $info = Information::find($id);
    
        if (!$info) {
            return response()->json(['message' => 'information tidak ditemukan'], 404);
        }
    
        Log::info("Data gambar yang akan dihapus:", ['id' => $info->id, 'image' => $info->picture]);
    
        // Hapus gambar dari storage jika ada
        if ($info->picture && Storage::disk('public')->exists($info->picture)) {
            Storage::disk('public')->delete($info->picture);
        }
    
        // Hapus data gambar dari database
        $info->delete();
    
        Log::info("Gambar dengan ID: {$info->id} berhasil dihapus dari database");
    
        return response()->json([
            'message' => 'Information berhasil dihapus',
        ], 200);
    }
}
