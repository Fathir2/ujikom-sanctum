<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Agenda;
use App\Models\Information;
use App\Models\Image;
use App\Models\Gallery;


class SearchController extends Controller
{
    public function search(Request $request)
    {
        $query = $request->get('q');
        
        // Mencari di tabel Agenda
        $agendas = Agenda::where('title_agenda', 'LIKE', "%{$query}%")
            ->orWhere('desc_agenda', 'LIKE', "%{$query}%")
            ->get()
            ->map(function ($agenda) {
                return [
                    'id' => $agenda->id,
                    'title' => $agenda->title_agenda,
                    'description' => $agenda->desc_agenda,
                    'date' => $agenda->due_date,
                    'type' => 'agenda'
                ];
            });

        // Mencari di tabel Information
        $information = Information::where('title', 'LIKE', "%{$query}%")
            ->orWhere('description', 'LIKE', "%{$query}%")
            ->get()
            ->map(function ($info) {
                return [
                    'id' => $info->id,
                    'title' => $info->title,
                    'description' => $info->description,
                    'image' => $info->picture,
                    'type' => 'information'
                ];
            });

        // Mencari di tabel Image/Gallery
        $images = Image::where('title_image', 'LIKE', "%{$query}%")
            ->orWhere('description', 'LIKE', "%{$query}%")
            ->get()
            ->map(function ($image) {
                return [
                    'id' => $image->id,
                    'title' => $image->title_image,
                    'description' => $image->description,
                    'image' => $image->image,
                    'type' => 'gallery'
                ];
            });

        // Menggabungkan semua hasil
        $results = $agendas->concat($information)->concat($images);

        return response()->json($results);
    }
}

