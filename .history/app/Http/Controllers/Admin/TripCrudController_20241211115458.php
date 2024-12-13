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

        // Kiểm tra nếu có tham số `name` trong request
        if (request()->has('name') && request()->name) {
            $this->crud->addClause('where', 'name', 'LIKE', '%' . request()->name . '%');
        }
        // Lọc theo giá min
        if (request()->filled('price_min')) {
            $this->crud->addClause('where', 'price', '>=', request()->price_min);
        }

        // Lọc theo giá max
        if (request()->filled('price_max')) {
            $this->crud->addClause('where', 'price', '<=', request()->price_max);
        }
    }

    protected function setupCreateOperation()
    {
        $this->crud->setValidation(TripRequest::class);

        // Trường dropdown cho Destination
        $this->crud->addField([
            'name'  => 'destination_id',  // Cột lưu destination_id trong bảng trip
            'label' => 'Destination',
            'type'  => 'select',
            'entity' => 'destination',  // Liên kết với bảng destinations
            'model'  => 'App\Models\Destinations',  // Mô hình Destination
            'attribute' => 'name',  // Hiển thị tên của destination
            'options'   => (function ($query) {
                return $query->orderBy('name', 'ASC')->get();  // Lấy tất cả destination đã sắp xếp
            }),
            'rules' => 'required',
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
