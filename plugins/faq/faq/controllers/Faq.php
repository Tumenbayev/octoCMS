<?php namespace Faq\Faq\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Faq Back-end Controller
 */
class Faq extends Controller
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

        BackendMenu::setContext('Faq.Faq', 'faq', 'faq');
    }
}
