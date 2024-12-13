<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\DestinationsRequest;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;

/**
 * Class DestinationsCrudController
 * @package App\Http\Controllers\Admin
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class DestinationsCrudController extends CrudController
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
        CRUD::setModel(\App\Models\Destinations::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/destinations');
        CRUD::setEntityNameStrings('destinations', 'destinations');
    }

    /**
     * Define what happens when the List operation is loaded.
     * 
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     * @return void
     */
    protected function setupListOperation()
    {
        CRUD::setFromDb(); // set columns from db columns.

        if (request()->has('category') && request()->category) {
            $this->crud->addClause('where', 'category', '=', request()->category);
        }
    

    // Lọc dữ liệu nếu có request
    }

    /**
     * Define what happens when the Create operation is loaded.
     * 
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(DestinationsRequest::class);
        //CRUD::setFromDb();
        $this->crud->addField([
            'name' => 'name',
            'label' => 'Destination Name',
            'type' => 'text',
        ]);
    
        $this->crud->addField([
            'name' => 'country',
            'label' => 'Country',
            'type' => 'text',
        ]);
    
        $this->crud->addField([
            'name' => 'city',
            'label' => 'City',
            'type' => 'text',
        ]);

        $this->crud->addField([
            'name' => 'description',
            'label' => 'description',
            'type' => 'text',
        ]);

        $this->crud->addField([
            'name' => 'average temp',
            'label' => 'description',
            'type' => 'text',
        ]);
    
        $this->crud->addField([
            'name' => 'category',
            'label' => 'Category',
            'type' => 'select_from_array',
            'options' => [
                'City' => 'City',
                'Beach' => 'Beach',
                'Mountain' => 'Mountain',
                'Desert' => 'Desert',
            ],
            'allows_null' => false,
        ]);
    
    }

    /**
     * Define what happens when the Update operation is loaded.
     * 
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }
}
