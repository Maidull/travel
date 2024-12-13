<form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px;">
        <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px;">
        <button type="submit" style="padding: 5px;">Search</button>
    </div>
</form>
