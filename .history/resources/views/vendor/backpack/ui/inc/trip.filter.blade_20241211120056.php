<form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px;">
        <!-- Input Filter Tên -->
        <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px;">

<!-- Input Filter Ngày Bắt Đầu -->
<input type="date" name="start_date" placeholder="Start Date" value="{{ request()->start_date }}" style="padding: 5px; width: 150px;">

<!-- Input Filter Ngày Kết Thúc -->
<input type="date" name="end_date" placeholder="End Date" value="{{ request()->end_date }}" style="padding: 5px; width: 150px;">

    </div>
</form>
