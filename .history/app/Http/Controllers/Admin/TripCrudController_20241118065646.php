<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\TripRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class TripCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class TripCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     * 
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Trip::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/trip');
        CRUD::setEntityNameStrings('trip', 'trips');

        
    }

    /**
     * Define what happens when the List operation is loaded.
     * 
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        // Hiển thị các cột trong bảng danh sách
        $this->crud->addColumn([
            'name' => 'destination_id',
            'label' => 'Destination',
            'type' => 'select',
            'entity' => 'destination', // Tên hàm quan hệ trong Model Trip
            'model' => 'App\Models\Destinations',
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
            'name'  => 'destination_id',
            'label' => 'Destination',
            'type'  => 'select',
            'entity' => 'destination',
            'model'  => 'App\Models\Destination',
            'attribute' => 'name',  // Hiển thị tên destination
            'options'   => (function ($query) {
                return $query->orderBy('name', 'ASC')->get();
            }),
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