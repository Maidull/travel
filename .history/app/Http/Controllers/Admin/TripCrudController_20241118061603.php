<?php

namespace App\Http\Controllers\Admin;

use Backpack\CRUD\app\Http\Controllers\CrudController;
use App\Http\Requests\TripRequest;
use App\Models\Destination;

class TripCrudController extends CrudController
{
    public function setup()
    {
        $this->crud->setModel(\App\Models\Trip::class);
        $this->crud->setRoute(config('backpack.base.route_prefix') . '/trip');
        $this->crud->setEntityNameStrings('trip', 'trips');
    }

    protected function setupListOperation()
    {
        // Hiển thị các cột trong bảng danh sách
        $this->crud->addColumn([
            'name' => 'destination_id',
            'label' => 'Destination',
            'type' => 'select',
            'entity' => 'destination', // Tên hàm quan hệ trong Model Trip
            'model' => 'App\Models\Destination',
            'attribute' => 'name', // Tên cột hiển thị
        ]);

        $this->crud->addColumn([
            'name' => 'name',
            'label' => 'Trip Name',
            'type' => 'text',
        ]);

        $this->crud->addColumn([
            'name' => 'price',
            'label' => 'Price',
            'type' => 'number',
        ]);

        $this->crud->addColumn([
            'name' => 'start_date',
            'label' => 'Start Date',
            'type' => 'date',
        ]);

        $this->crud->addColumn([
            'name' => 'end_date',
            'label' => 'End Date',
            'type' => 'date',
        ]);
    }

    protected function setupCreateOperation()
    {
        $this->crud->setValidation(TripRequest::class);

        // Trường dropdown cho Destination
        $this->crud->addField([
            'name' => 'destination_id',
            'label' => 'Destination',
            'type' => 'select',
            'entity' => 'destination', // Tên hàm quan hệ trong Model Trip
            'model' => 'App\Models\Destination',
            'attribute' => 'name', // Tên cột hiển thị trong dropdown
        ]);

        $this->crud->addField([
            'name' => 'name',
            'label' => 'Trip Name',
            'type' => 'text',
        ]);

        $this->crud->addField([
            'name' => 'description',
            'label' => 'Description',
            'type' => 'textarea',
        ]);

        $this->crud->addField([
            'name' => 'duration',
            'label' => 'Duration (days)',
            'type' => 'number',
        ]);

        $this->crud->addField([
            'name' => 'price',
            'label' => 'Price',
            'type' => 'number',
        ]);

        $this->crud->addField([
            'name' => 'start_date',
            'label' => 'Start Date',
            'type' => 'date',
        ]);

        $this->crud->addField([
            'name' => 'end_date',
            'label' => 'End Date',
            'type' => 'date',
        ]);
    }

    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}
