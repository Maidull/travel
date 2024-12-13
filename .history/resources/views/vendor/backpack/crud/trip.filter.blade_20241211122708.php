@extends('backpack::layout')

@section('content')
<form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
    <div style="display: flex; gap: 10px; align-items: center;">
        <!-- Input Filter Tên -->
        <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px; width: 200px;">

        <!-- Input Filter Ngày Bắt Đầu -->
        <input type="date" name="start_date" placeholder="Start Date" value="{{ request()->start_date }}" style="padding: 5px; width: 150px;">

        <!-- Input Filter Ngày Kết Thúc -->
        <input type="date" name="end_date" placeholder="End Date" value="{{ request()->end_date }}" style="padding: 5px; width: 150px;">

        <!-- Nút Submit -->
        <button type="submit" style="padding: 5px 15px; background-color: #007bff; color: white; border: none; cursor: pointer;">Filter</button>
    </div>
</form>

<table class="table">
    <thead>
        <tr>
            <th>Trip Name</th>
            <th>Start Date</th>
            <th>End Date</th>
        </tr>
    </thead>
    <tbody>
        @foreach($entries as $entry)
            <tr>
                <td>{{ $entry->name }}</td>
                <td>{{ $entry->start_date }}</td>
                <td>{{ $entry->end_date }}</td>
            </tr>
        @endforeach
    </tbody>
</table>
@endsection
