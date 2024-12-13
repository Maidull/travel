<form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px;">
        
        <!-- Filter by start date -->
        <input type="date" name="start_date" placeholder="Start Date" value="{{ request()->start_date }}" style="padding: 5px;">
        
        <!-- Filter by end date -->
        <input type="date" name="end_date" placeholder="End Date" value="{{ request()->end_date }}" style="padding: 5px;">
        
        <!-- Submit button -->
        <button type="submit" style="padding: 5px;">Search</button>
    </div>
</form>
