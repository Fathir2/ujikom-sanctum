<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AgendaResource;
use App\Models\Agenda;
use Illuminate\Http\Request;

class AgendaController extends Controller
{
    public function index()
    {
        $agenda = Agenda::all();
        return AgendaResource::collection($agenda);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title_agenda' => 'required|string|max:255',
            'desc_agenda' => 'nullable|string',
            'due_date' => 'required|date',
        ]);

        // Assuming you have a relation 'information' on the User model
        $agenda = $request->user()->agenda()->create($validated);

        return new AgendaResource($agenda);
    }

    public function show(Agenda $agenda)
    {
        return new AgendaResource($agenda);
    }

    public function update(Request $request, Agenda $agenda)
    {
        $validated = $request->validate([
            'title_agenda' => 'required|string|max:255',
            'desc_agenda' => 'nullable|string',
            'due_date' => 'required|date',
        ]);

        $agenda->update($validated);

        return new AgendaResource($agenda);
    }

    public function destroy(Agenda $agenda)
    {
        $agenda->delete();
        return response()->json(null, 204);
    }
}
