<form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px;">
        <!-- Input Filter Tên -->
        <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px;">

        <!-- Button -->
        <button type="submit" style="padding: 5px;">Search</button>
    </div>
</form>

<form method="GET" action="{{ url(config('backpack.base.route_prefix', 'admin') . '/trip') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px; align-items: center;">
        <!-- Input Lọc Theo Giá Min -->
        <input type="number" name="price_min" placeholder="Min Price" value="{{ request()->price_min }}" style="padding: 5px; width: 120px;">

        <!-- Input Lọc Theo Giá Max -->
        <input type="number" name="price_max" placeholder="Max Price" value="{{ request()->price_max }}" style="padding: 5px; width: 120px;">

        <!-- Nút Submit -->
        <button type="submit" style="padding: 5px;">Filter</button>
    </div>
</form>