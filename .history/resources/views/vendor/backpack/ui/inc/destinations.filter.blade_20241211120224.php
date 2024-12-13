<form method="GET" action="{{ url(config('backpack.base.route_prefix', 'admin') . '/destinations') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px;">
        <!-- Input Filter Tên -->
        <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px;">

    </div>
</form>
