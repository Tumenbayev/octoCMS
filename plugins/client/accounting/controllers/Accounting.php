<?php namespace Client\Accounting\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Accounting Back-end Controller
 */
class Accounting extends Controller
{
    public $implement = [
        'Backend.Behaviors.FormController',
        'Backend.Behaviors.ListController'
    ];

    public $formConfig = 'config_form.yaml';
    public $listConfig = 'config_list.yaml';

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Client.Accounting', 'accounting', 'accounting');
    }
}
