@extends('backpack::layout')


    <div class="container">
        <h1>List of Trips</h1>

        <form method="GET" action="{{ route('trip.index') }}" style="margin-bottom: 20px;">
            <div style="display: flex; gap: 10px;">
                <!-- Input Filter Tên -->
                <input type="text" name="name" placeholder="Filter by Name" value="{{ request()->name }}" style="padding: 5px;">
                
                <!-- Filter by Start Date -->
                <input type="date" name="start_date" placeholder="Filter by Start Date" value="{{ request()->start_date }}" style="padding: 5px;">
                
                <!-- Filter by End Date -->
                <input type="date" name="end_date" placeholder="Filter by End Date" value="{{ request()->end_date }}" style="padding: 5px;">
                
                <!-- Button -->
                <button type="submit" style="padding: 5px;">Search</button>
            </div>
        </form>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Destination</th>
                    <th>Trip Name</th>
                    <th>Price</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                </tr>
            </thead>
            <tbody>
                @foreach($trips as $trip)
                    <tr>
                        <td>{{ $trip->destination->name }}</td>
                        <td>{{ $trip->name }}</td>
                        <td>{{ $trip->price }}</td>
                        <td>{{ $trip->start_date }}</td>
                        <td>{{ $trip->end_date }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

