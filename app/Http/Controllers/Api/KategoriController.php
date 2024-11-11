<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cathegory;
use App\Http\Resources\CathegoryResource;

class KategoriController extends Controller
{
    public function index()
    {
        
            $cathegory = Cathegory::all();
            return CathegoryResource::collection($cathegory);
        
    
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255'
        ]);

        // Pastikan relasi 'galeri' ada di User model
        $cathegory = $request->user()->cathegory()->create($validated);

        return new CathegoryResource($cathegory);
    }

    public function show(Cathegory $cathegory)
    {
        return new CathegoryResource($cathegory);
    }

    public function update(Request $request, Cathegory $cathegory)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
        ]);

        $cathegory->update($validated); 

        return new CathegoryResource($cathegory);
    }

    public function destroy(Cathegory $cathegory)
    {
        $cathegory->delete();
    
        return response()->json([
            'message' => 'Data berhasil dihapus'
        ], 200);
    }   



}
