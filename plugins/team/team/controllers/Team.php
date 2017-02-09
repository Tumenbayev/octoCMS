<?php namespace Team\Team\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * Team Back-end Controller
 */
class Team extends Controller
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

        BackendMenu::setContext('Team.Team', 'team', 'team');
    }
}
