<form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px;">
        <!-- Input Filter Tên -->
        <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px;">

        <!-- Input Filter Giá Chính Xác -->
        <input type="number" step="0.01" name="price" placeholder="Filter by Price" value="{{ request()->price }}" style="padding: 5px; width: 150px;">
    </div>
</form>
