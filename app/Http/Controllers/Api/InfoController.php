<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Information;
use App\Http\Resources\InfoResource;
use Illuminate\Http\Request;

class InfoController extends Controller
{
    public function index()
    {
        $info = Information::all();
        return InfoResource::collection($info);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'date' => 'required|date',
        ]);

        // Assuming you have a relation 'information' on the User model
        $info = $request->user()->information()->create($validated);

        return new InfoResource($info);
    }

    public function show(Information $info)
    {
        return new InfoResource($info);
    }

    public function update(Request $request, Information $info)
    {
        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'date' => 'required|date',
        ]);

        $info->update($validated);

        return new InfoResource($info);
    }

    public function destroy(Information $info)
    {
        $info->delete();
        return response()->json(null, 204);
    }
}
